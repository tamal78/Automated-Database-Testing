import re
import argparse
import os
import multiprocessing
import sys

# --- Configuration ---

# Keywords to identify query failures from unstructured lines.
FAILURE_KEYWORDS = [
    'error',
    'failure',
    'exception',
    'ora-',          # Oracle errors
    'psqlexception', # PostgreSQL Java errors
    'syntax error',
    'doesn\'t exist',
    'permission denied',
    '--- end result (failure) ---' # Explicit failure marker
]

# --- Worker Function for Multiprocessing ---

def worker_analyze_file(diff_file_path):
    """
    Analyzes a single .diff file and returns a dictionary of categorized errors.
    This function is designed to be run in a separate process.
    """
    print(f"Processing: {diff_file_path}...")
    error_summary = {
        "missing_rows": [],
        "additional_rows": [],
        "query_failures": [],
        "missing_columns": [],
        "additional_columns": [],
        "element_mismatches": [],
    }

    # Enhanced patterns to handle complex and combined error lines
    patterns = {
        "extra_line_ctr": re.compile(r"Extra line \d+ in (.*\.ctr): .*"),
        "extra_line_res": re.compile(r"Extra line \d+ in (.*\.res): .*"),
        "mismatch_segment": re.compile(r"mismatch\(es\): (.*?)(?:, missing word\(s\)|, extra word\(s\)|$)"),
        "missing_word_segment": re.compile(r"missing word\(s\): (.*?)(?:, mismatch\(es\)|, extra word\(s\)|$)"),
        "extra_word_segment": re.compile(r"extra word\(s\): (.*?)(?:, mismatch\(es\)|, missing word\(s\)|$)"),
        "mismatch_detail": re.compile(r"expected '(.*?)', got '(.*?)'"),
        "query_header": re.compile(r"Query #\d+:?"),
        "line_number": re.compile(r"^Line (\d+),"),
    }

    failure_logged_for_current_query = False
    current_query = f"General ({os.path.basename(diff_file_path)})" # Add filename for context

    try:
        with open(diff_file_path, 'r', encoding='utf-8') as f_diff:
            for diff_line in f_diff:
                diff_line = diff_line.strip()
                if not diff_line:
                    continue

                if patterns["query_header"].match(diff_line):
                    current_query = f"{os.path.basename(diff_file_path)} - {diff_line.rstrip(':')}"
                    failure_logged_for_current_query = False
                    continue

                line_was_categorized = False

                if patterns["extra_line_ctr"].match(diff_line):
                    error_summary["missing_rows"].append(f"{current_query}: {diff_line}")
                    continue
                
                if patterns["extra_line_res"].match(diff_line):
                    error_summary["additional_rows"].append(f"{current_query}: {diff_line}")
                    continue

                line_num_match = patterns["line_number"].search(diff_line)
                line_prefix = f"{current_query}: Line {line_num_match.group(1)}" if line_num_match else f"{current_query}"

                mismatch_search = patterns["mismatch_segment"].search(diff_line)
                if mismatch_search:
                    content = mismatch_search.group(1)
                    all_mismatches = patterns["mismatch_detail"].findall(content)
                    for expected, got in all_mismatches:
                        detail = f"{line_prefix}, mismatch: expected '{expected}', got '{got}'"
                        error_summary["element_mismatches"].append(detail)
                    line_was_categorized = True

                missing_word_search = patterns["missing_word_segment"].search(diff_line)
                if missing_word_search:
                    content = missing_word_search.group(1).strip()
                    detail = f"{line_prefix}, missing word(s): {content}"
                    error_summary["missing_columns"].append(detail)
                    line_was_categorized = True

                extra_word_search = patterns["extra_word_segment"].search(diff_line)
                if extra_word_search:
                    content = extra_word_search.group(1).strip()
                    detail = f"{line_prefix}, extra word(s): {content}"
                    error_summary["additional_columns"].append(detail)
                    line_was_categorized = True

                if not line_was_categorized and not failure_logged_for_current_query:
                    line_lower = diff_line.lower()
                    for keyword in FAILURE_KEYWORDS:
                        if keyword in line_lower:
                            error_summary["query_failures"].append(f"{current_query}: {diff_line}")
                            failure_logged_for_current_query = True
                            break
    
    except FileNotFoundError:
        print(f"Error: Input diff file not found at '{diff_file_path}'", file=sys.stderr)
        return None
    except Exception as e:
        print(f"An unexpected error occurred during analysis of {diff_file_path}: {e}", file=sys.stderr)
        return None

    return error_summary

# --- Utility Functions ---

def merge_summaries(summaries):
    """
    Merges a list of error_summary dictionaries into a single dictionary.
    """
    merged_summary = {
        "missing_rows": [],
        "additional_rows": [],
        "query_failures": [],
        "missing_columns": [],
        "additional_columns": [],
        "element_mismatches": [],
    }
    for summary in summaries:
        if summary: # Filter out None results from failed analyses
            for key, value_list in summary.items():
                merged_summary[key].extend(value_list)
    return merged_summary

def write_summary_report(final_summary, output_file_path):
    """
    Writes the final, merged error summary to a single report file.
    """
    try:
        with open(output_file_path, 'w', encoding='utf-8') as f_out:
            f_out.write("## COMBINED ANALYSIS SUMMARY\n\n")

            total_issues = sum(len(v) for v in final_summary.values())
            f_out.write(f"Total issues found: {total_issues}\n\n")
            
            f_out.write("Issue breakdown:\n")
            f_out.write(f"- Query Failures: {len(final_summary['query_failures'])}\n")
            f_out.write(f"- Element/Cell Mismatches: {len(final_summary['element_mismatches'])}\n")
            f_out.write(f"- Missing Rows: {len(final_summary['missing_rows'])}\n")
            f_out.write(f"- Additional Rows: {len(final_summary['additional_rows'])}\n")
            f_out.write(f"- Missing Columns: {len(final_summary['missing_columns'])}\n")
            f_out.write(f"- Additional Columns: {len(final_summary['additional_columns'])}\n")
            
            sorted_keys = sorted(final_summary.keys())
            
            for key in sorted_keys:
                error_list = final_summary[key]
                if error_list:
                    title = key.replace('_', ' ').title()
                    f_out.write(f"\n## DETAILS: {title} ({len(error_list)})\n\n")
                    for error_detail in sorted(error_list):
                        f_out.write(f"- {error_detail}\n")

        print(f"\nAnalysis complete. Combined report written to '{output_file_path}'")

    except IOError as e:
        print(f"Error writing combined report to '{output_file_path}': {e}", file=sys.stderr)

# --- Main Execution ---

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Analyzes multiple diff files in parallel to categorize errors and create a single, combined report.",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        "diff_file_paths", 
        nargs='+',
        help="One or more paths to the input .diff files."
    )
    parser.add_argument(
        "--output", "-o",
        dest="output_file_path",
        default="combined_analysis_report.txt",
        help="Optional: Path for the combined output .txt report.\nDefaults to 'combined_analysis_report.txt'."
    )
    
    args = parser.parse_args()

    # Use a Pool of processes to parallelize the analysis
    try:
        with multiprocessing.Pool() as pool:
            # pool.map applies the worker function to each file path
            # and returns a list of the results.
            results = pool.map(worker_analyze_file, args.diff_file_paths)
        
        print("\nMerging results...")
        
        # Filter out potential None results from files that failed to open or parse
        successful_results = [res for res in results if res is not None]

        if not successful_results:
            print("No analysis could be completed. No report will be generated.", file=sys.stderr)
            sys.exit(1)

        final_summary = merge_summaries(successful_results)
        
        write_summary_report(final_summary, args.output_file_path)

    except Exception as e:
        print(f"A critical error occurred during multiprocessing: {e}", file=sys.stderr)
        sys.exit(1)
