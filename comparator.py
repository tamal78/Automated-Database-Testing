#!/usr/bin/env python3
import sys
import os
import difflib
import re

def compare_files(base_name, diff_file):
    """
    Compares a control file with a result file and generates a diff file.

    Args:
        base_name (str): The base name for the input files (e.g., 'aggregation').
        diff_file (str): The full path for the output diff file.
    """
    # Construct input file paths based on the runner script's directory structure
    ctr_file = f"./control_files/{base_name}.ctr"
    res_file = f"./results/{base_name}.res"

    if not os.path.exists(ctr_file):
        print(f"Error: Control file '{ctr_file}' not found.")
        return
    if not os.path.exists(res_file):
        print(f"Error: Result file '{res_file}' not found.")
        return

    with open(ctr_file, 'r', encoding='utf-8') as f1, open(res_file, 'r', encoding='utf-8') as f2:
        lines1 = f1.readlines()
        lines2 = f2.readlines()

    errors_by_query = {}
    current_query = None

    def add_error(error_message):
        query_key = current_query if current_query else "Unknown Query"
        if query_key not in errors_by_query:
            errors_by_query[query_key] = []
        errors_by_query[query_key].append(error_message)

    query_number_pattern = re.compile(r'-- Query (\d+):')
    for line in lines1:
        match = query_number_pattern.match(line.strip())
        if match:
            query_key = f"Query #{match.group(1)}:"
            errors_by_query[query_key] = []

    current_query = None

    line_matcher = difflib.SequenceMatcher(None,
                                         [line.strip() for line in lines1],
                                         [line.strip() for line in lines2])

    for tag, i1, i2, j1, j2 in line_matcher.get_opcodes():
        if tag == 'equal':
            for line_idx in range(i1, i2):
                match = query_number_pattern.match(lines1[line_idx].strip())
                if match:
                    current_query = f"Query #{match.group(1)}:"
            continue
        
        elif tag == 'replace':
            for line_idx in range(min(i2 - i1, j2 - j1)):
                ctr_line_num = i1 + line_idx
                res_line_num = j1 + line_idx
                ctr_line = lines1[ctr_line_num].strip()
                res_line = lines2[res_line_num].strip()

                match = query_number_pattern.match(ctr_line)
                if match:
                    current_query = f"Query #{match.group(1)}:"

                error_match = re.search(r'ERROR \d+ \(.*\) at line \d+: .*', res_line)
                end_result_match = re.search(r'--- End Result \((.*)\) ---', res_line)

                if error_match:
                    add_error(f"Line {ctr_line_num + 1}: {error_match.group(0)}")
                
                elif end_result_match:
                    status = end_result_match.group(1)
                    if status.lower() == 'failure':
                        add_error(f"Line {ctr_line_num + 1}: {end_result_match.group(0)}")

                elif ctr_line != res_line:
                    words1 = ctr_line.split()
                    words2 = res_line.split()
                    
                    word_matcher = difflib.SequenceMatcher(None, words1, words2)
                    line_num = ctr_line_num + 1
                    
                    missing_words = []
                    extra_words = []
                    mismatched_details = []

                    for wtag, wi1, wi2, wj1, wj2 in word_matcher.get_opcodes():
                        if wtag == 'delete':
                            missing_words.extend([f"'{word}'" for word in words1[wi1:wi2]])
                        elif wtag == 'insert':
                            extra_words.extend([f"'{word}'" for word in words2[wj1:wj2]])
                        elif wtag == 'replace':
                            for k in range(min(wi2 - wi1, wj2 - wj1)):
                                mismatched_details.append(f"expected '{words1[wi1 + k]}', got '{words2[wj1 + k]}'")
                    
                    error_parts = []
                    if missing_words:
                        error_parts.append(f"missing word(s): {', '.join(missing_words)}")
                    if extra_words:
                        error_parts.append(f"extra word(s): {', '.join(extra_words)}")
                    if mismatched_details:
                        error_parts.append(f"mismatch(es): {'; '.join(mismatched_details)}")

                    if error_parts:
                        add_error(f"Line {line_num}, {', '.join(error_parts)}")

            if (i2 - i1) > (j2 - j1):
                for idx in range(j2 - j1, i2 - i1):
                    add_error(f"Extra line {i1 + idx + 1} in {ctr_file}: {lines1[i1 + idx].strip()}")
            elif (j2 - j1) > (i2 - i1):
                for idx in range(i2 - i1, j2 - j1):
                    add_error(f"Extra line {j1 + idx + 1} in {res_file}: {lines2[j1 + idx].strip()}")
        
        elif tag == 'delete':
            for idx in range(i1, i2):
                ctr_line = lines1[idx].strip()
                if query_number_pattern.match(ctr_line):
                    continue
                add_error(f"Extra line {idx + 1} in {ctr_file}: {ctr_line}")
                
        elif tag == 'insert':
            for idx in range(j1, j2):
                add_error(f"Extra line {idx + 1} in {res_file}: {lines2[idx].strip()}")

    errors_by_query = {query: errors for query, errors in errors_by_query.items() if errors}

    diff_dir = os.path.dirname(diff_file)
    if diff_dir:
        os.makedirs(diff_dir, exist_ok=True)

    with open(diff_file, 'w', encoding='utf-8') as df:
        if errors_by_query:
            for query, errors in errors_by_query.items():
                if not errors:
                    continue
                df.write(f"{query}\n")
                for err in errors:
                    df.write(err + '\n')
                df.write("\n")
            print(f"Differences written to {diff_file}")
        else:
            print(f"No differences found. Empty diff file created at {diff_file}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 comparator.py <base_filename> <diff_filepath>")
        sys.exit(1)
        
    base_filename = sys.argv[1]
    diff_filepath = sys.argv[2]
    compare_files(base_filename, diff_filepath)

