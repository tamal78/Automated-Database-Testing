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
    Analyzes a single .diff file and returns its path and a dictionary of errors.
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
    current_query = f"General ({os.path.basename(diff_file_path)})"

    try:
        with open(diff_file_path, 'r', encoding='utf-8') as f_diff:
            for diff_line in f_diff:
                diff_line = diff_line.strip()
                if not diff_line: continue
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
                    for expected, got in patterns["mismatch_detail"].findall(content):
                        error_summary["element_mismatches"].append(f"{line_prefix}, mismatch: expected '{expected}', got '{got}'")
                    line_was_categorized = True
                missing_word_search = patterns["missing_word_segment"].search(diff_line)
                if missing_word_search:
                    error_summary["missing_columns"].append(f"{line_prefix}, missing word(s): {missing_word_search.group(1).strip()}")
                    line_was_categorized = True
                extra_word_search = patterns["extra_word_segment"].search(diff_line)
                if extra_word_search:
                    error_summary["additional_columns"].append(f"{line_prefix}, extra word(s): {extra_word_search.group(1).strip()}")
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
        return (diff_file_path, None)
    except Exception as e:
        print(f"An unexpected error occurred during analysis of {diff_file_path}: {e}", file=sys.stderr)
        return (diff_file_path, None)

    return (diff_file_path, error_summary)

# --- Utility Functions ---

def merge_summaries(summaries):
    """Merges a list of error_summary dictionaries into a single dictionary."""
    merged = {k: [] for k in FAILURE_KEYWORDS_MAPPING.values()}
    for summary in summaries:
        if summary:
            for key, value_list in summary.items():
                merged[key].extend(value_list)
    return merged

def write_summary_report(final_summary, output_file_path, report_title=None, files_with_errors=None, files_without_errors=None):
    """
    Writes the final summary report, including a file-level summary.
    """
    try:
        with open(output_file_path, 'w', encoding='utf-8') as f_out:
            if report_title:
                f_out.write(f"## {report_title}\n\n")
            else:
                f_out.write("## ANALYSIS SUMMARY\n\n")

            # --- New File Summary Section ---
            f_out.write("### File-Level Summary\n\n")
            if files_without_errors is not None:
                f_out.write(f"**Files with NO errors ({len(files_without_errors)}):**\n")
                if files_without_errors:
                    for filename in sorted(files_without_errors):
                        f_out.write(f"- `{filename}`\n")
                else:
                    f_out.write("- None\n")
                f_out.write("\n")

            if files_with_errors is not None:
                f_out.write(f"**Files with errors ({len(files_with_errors)}):**\n")
                if files_with_errors:
                    for filename in sorted(files_with_errors):
                        f_out.write(f"- `{filename}`\n")
                else:
                    f_out.write("- None\n")
                f_out.write("\n")
            
            f_out.write("---\n\n") # Separator

            # --- Existing Issue Breakdown Section ---
            total_issues = sum(len(v) for v in final_summary.values())
            if total_issues > 0:
                f_out.write(f"### Aggregate Issue Breakdown\n\n")
                f_out.write(f"Total issues found across all files: {total_issues}\n\n")
                
                f_out.write("Issue breakdown:\n")
                f_out.write(f"- Query Failures: {len(final_summary['query_failures'])}\n")
                f_out.write(f"- Element/Cell Mismatches: {len(final_summary['element_mismatches'])}\n")
                f_out.write(f"- Missing Rows: {len(final_summary['missing_rows'])}\n")
                f_out.write(f"- Additional Rows: {len(final_summary['additional_rows'])}\n")
                f_out.write(f"- Missing Columns: {len(final_summary['missing_columns'])}\n")
                f_out.write(f"- Additional Columns: {len(final_summary['additional_columns'])}\n")
                
                for key, error_list in sorted(final_summary.items()):
                    if error_list:
                        title = key.replace('_', ' ').title()
                        f_out.write(f"\n## DETAILS: {title} ({len(error_list)})\n\n")
                        for error_detail in sorted(error_list):
                            f_out.write(f"- {error_detail}\n")

    except IOError as e:
        print(f"Error writing report to '{output_file_path}': {e}", file=sys.stderr)

# Define the mapping for merge_summaries after the function is defined
FAILURE_KEYWORDS_MAPPING = {
    'missing_rows': 'missing_rows',
    'additional_rows': 'additional_rows',
    'query_failures': 'query_failures',
    'missing_columns': 'missing_columns',
    'additional_columns': 'additional_columns',
    'element_mismatches': 'element_mismatches',
}

# --- Main Execution ---

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Analyzes one or more diff files to categorize errors.",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument("diff_file_paths", nargs='+', help="One or more paths to the input .diff files.")
    parser.add_argument("--output", "-o", dest="output_file_path", required=True, help="Path for the output .txt report.")
    parser.add_argument("--title", dest="report_title", default=None, help="Optional: Custom title for the analysis report.")
    args = parser.parse_args()

    try:
        with multiprocessing.Pool() as pool:
            results_with_paths = pool.map(worker_analyze_file, args.diff_file_paths)
        
        files_with_errors = []
        files_without_errors = []
        summaries_to_merge = []

        def summary_has_errors(summary):
            """Check if a summary dictionary contains any error strings."""
            if not summary:
                return False
            return any(summary.values())

        for path, summary in results_with_paths:
            basename = os.path.basename(path)
            if summary is None:
                files_with_errors.append(f"{basename} (analysis failed)")
            elif summary_has_errors(summary):
                files_with_errors.append(basename)
                summaries_to_merge.append(summary)
            else:
                files_without_errors.append(basename)

        final_summary = merge_summaries(summaries_to_merge)
        write_summary_report(final_summary, args.output_file_path, args.report_title, files_with_errors, files_without_errors)

        print("\nAnalysis complete.")
        if files_with_errors:
            print(f"  - Files with errors: {len(files_with_errors)}")
        if files_without_errors:
            print(f"  - Files with no errors: {len(files_without_errors)}")
        print(f"Report written to '{args.output_file_path}'")

    except Exception as e:
        print(f"A critical error occurred during multiprocessing: {e}", file=sys.stderr)
        sys.exit(1)
