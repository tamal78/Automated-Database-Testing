import re
import argparse
import os
from datetime import datetime

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

# --- Main Analysis Logic ---

def analyze_diff_file(diff_file_path, output_file_path):
    """
    Analyzes a .diff file, categorizes errors, and groups multiple failure
    indicators into a single failure event per query.
    """
    # --- MODIFICATION START ---
    # "timestamp_mismatches" key removed from the dictionary.
    error_summary = {
        "missing_rows": [],
        "additional_rows": [],
        "query_failures": [],
        "missing_columns": [],
        "additional_columns": [],
        "element_mismatches": [],
    }
    # --- MODIFICATION END ---

    patterns = {
        "word_mismatch": re.compile(r"Line (\d+), word (\d+): expected '(.*?)', got '(.*?)'"),
        "extra_line_ctr": re.compile(r"Extra line (\d+) in (.*\.ctr): (.*)"),
        "extra_line_res": re.compile(r"Extra line (\d+) in (.*\.res): (.*)"),
        "missing_word": re.compile(r"Line (\d+), missing word at position (\d+): '(.*?)'"),
        "extra_word": re.compile(r"Line (\d+), extra word at position (\d+): '(.*?)'"),
        "query_header": re.compile(r"Query #\d+:?"),
    }

    failure_logged_for_current_query = False
    current_query = "General (No Query Header)"

    try:
        with open(diff_file_path, 'r', encoding='utf-8') as f_diff:
            for diff_line in f_diff:
                diff_line = diff_line.strip()
                if not diff_line:
                    continue

                if patterns["query_header"].match(diff_line):
                    current_query = diff_line.rstrip(':')
                    failure_logged_for_current_query = False
                    continue

                error_detail = f"{current_query}: {diff_line}"

                match_wm = patterns["word_mismatch"].match(diff_line)
                match_el_ctr = patterns["extra_line_ctr"].match(diff_line)
                match_el_res = patterns["extra_line_res"].match(diff_line)
                match_mw = patterns["missing_word"].match(diff_line)
                match_ew = patterns["extra_word"].match(diff_line)

                # --- MODIFICATION START ---
                # The logic to differentiate between a timestamp mismatch and a regular
                # element mismatch has been removed. All word mismatches are now
                # treated as element mismatches.
                if match_wm:
                    error_summary["element_mismatches"].append(error_detail)
                # --- MODIFICATION END ---
                elif match_el_ctr:
                    error_summary["missing_rows"].append(error_detail)
                elif match_el_res:
                    error_summary["additional_rows"].append(error_detail)
                elif match_mw:
                    error_summary["missing_columns"].append(error_detail)
                elif match_ew:
                    error_summary["additional_columns"].append(error_detail)
                else:
                    if not failure_logged_for_current_query:
                        line_lower = diff_line.lower()
                        for keyword in FAILURE_KEYWORDS:
                            if keyword in line_lower:
                                error_summary["query_failures"].append(error_detail)
                                failure_logged_for_current_query = True
                                break
    
    except FileNotFoundError:
        print(f"Error: Input diff file not found at '{diff_file_path}'")
        return
    except Exception as e:
        print(f"An unexpected error occurred during analysis: {e}")
        return

    # --- Write the Summary Report ---
    try:
        with open(output_file_path, 'w', encoding='utf-8') as f_out:
            f_out.write("## SUMMARY\n\n")
            
            f_out.write("Issue breakdown:\n")
            f_out.write(f"- Query Failures: {len(error_summary['query_failures'])}\n")
            f_out.write(f"- Element/Cell Mismatches: {len(error_summary['element_mismatches'])}\n")
            f_out.write(f"- Missing Rows: {len(error_summary['missing_rows'])}\n")
            f_out.write(f"- Additional Rows: {len(error_summary['additional_rows'])}\n")
            f_out.write(f"- Missing Columns: {len(error_summary['missing_columns'])}\n")
            f_out.write(f"- Additional Columns: {len(error_summary['additional_columns'])}\n")
            # --- MODIFICATION START ---
            # The line reporting on Timestamp Mismatches has been removed.
            # --- MODIFICATION END ---
            
            for key, error_list in error_summary.items():
                if error_list:
                    title = key.replace('_', ' ').title()
                    f_out.write(f"\n## DETAILS: {title} ({len(error_list)})\n\n")
                    for error_detail in error_list:
                        f_out.write(f"- {error_detail}\n")

        print(f"Analysis complete. Report written to '{output_file_path}'")

    except IOError as e:
        print(f"Error writing report to '{output_file_path}': {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Analyzes a diff file to categorize errors, grouping multiple failure lines into a single event per query.",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        "diff_file_path", 
        help="Path to the input .diff file."
    )
    parser.add_argument(
        "output_file_path",
        nargs='?',
        default=None,
        help="Optional: Path for the output .txt report.\nIf omitted, it defaults to '[diff_file_name]_analysis.txt'."
    )
    
    args = parser.parse_args()

    output_path = args.output_file_path
    
    if output_path is None:
        base_name, _ = os.path.splitext(args.diff_file_path)
        output_path = f"{base_name}_analysis.txt"
    
    analyze_diff_file(args.diff_file_path, output_path)
