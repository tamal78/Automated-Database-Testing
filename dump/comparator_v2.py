#!/usr/bin/env python3
import sys
import os
import difflib
import re

def compare_files(base_name):
    ctr_file = f"{base_name}.ctr"
    res_file = f"{base_name}.res"
    diff_file = f"{base_name}.diff"

    if not os.path.exists(ctr_file):
        print(f"Error: '{ctr_file}' not found.")
        return
    if not os.path.exists(res_file):
        print(f"Error: '{res_file}' not found.")
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
                
                # --- MODIFICATION START ---
                # Updated regex to capture the status (e.g., "Success", "Failure")
                end_result_match = re.search(r'--- End Result \((.*)\) ---', res_line)
                # --- MODIFICATION END ---

                if error_match:
                    add_error(f"Line {ctr_line_num + 1}: {error_match.group(0)}")
                
                # --- MODIFICATION START ---
                # Only add an error if the status is "Failure".
                # Lines with "Success" will be ignored.
                elif end_result_match:
                    status = end_result_match.group(1)
                    if status.lower() == 'failure':
                        add_error(f"Line {ctr_line_num + 1}: {end_result_match.group(0)}")
                    # If status is 'Success', we do nothing, so it's not reported.
                # --- MODIFICATION END ---

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

    if errors_by_query:
        with open(diff_file, 'w', encoding='utf-8') as df:
            for query, errors in errors_by_query.items():
                if not errors:
                    continue
                df.write(f"{query}\n")
                for err in errors:
                    df.write(err + '\n')
                df.write("\n")
        print(f"Differences written to {diff_file}")
    else:
        print(f"No differences found. {ctr_file} and {res_file} match perfectly.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 compare_files.py <base_filename>")
    else:
        compare_files(sys.argv[1])
