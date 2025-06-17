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
        if current_query is None:
            # If no current query is set, use a default key
            query_key = "Unknown Query"
            if query_key not in errors_by_query:
                errors_by_query[query_key] = []
            errors_by_query[query_key].append(error_message)
        else:
            if current_query not in errors_by_query:
                errors_by_query[current_query] = []
            errors_by_query[current_query].append(error_message)

    # Initialize queries found in the control file
    # Change: Updated regex to match "-- Query #"
    query_number_pattern = re.compile(r'-- Query (\d+):') # Modified line
    for line in lines1:
        match = query_number_pattern.match(line.strip())
        if match:
            query_key = f"Query #{match.group(1)}:" # Format to match expected output
            errors_by_query[query_key] = []  # Initialize errors for the new query

    current_query = None  # Will be set during comparison

    # Use SequenceMatcher at the line level first to handle line insertions/deletions better
    line_matcher = difflib.SequenceMatcher(None, 
                                          [line.strip() for line in lines1], 
                                          [line.strip() for line in lines2])
    
    # Change: Updated regex to match "-- Query #"
    query_number_pattern = re.compile(r'-- Query (\d+):') # Modified line

    ctr_line_index = 0
    res_line_index = 0

    for tag, i1, i2, j1, j2 in line_matcher.get_opcodes():
        if tag == 'equal':
            for line_idx in range(i2 - i1):
                ctr_line = lines1[i1 + line_idx].strip()
                match = query_number_pattern.match(ctr_line)
                if match:
                    current_query = f"Query #{match.group(1)}:"  # Format to match expected output
                
            ctr_line_index = i2
            res_line_index = j2
            continue
        elif tag == 'replace':
            for line_idx in range(min(i2-i1, j2-j1)):
                ctr_line = lines1[i1 + line_idx].strip()
                res_line = lines2[j1 + line_idx].strip()

                match = query_number_pattern.match(ctr_line)
                if match:
                    current_query = f"Query #{match.group(1)}:"  # Format to match expected output
                
                # Check for the specific error message or the "End Result" lines
                error_match = re.search(r'ERROR \d+ \(.*\) at line \d+: .*', res_line)
                end_result_match = re.search(r'--- End Result \(.*\) ---', res_line)

                if error_match:
                    add_error(f"Line {i1 + line_idx + 1}: {error_match.group(0)}")
                elif end_result_match:
                    add_error(f"Line {i1 + line_idx + 1}: {end_result_match.group(0)}")
                else:
                    # Only compare words if the lines are not exactly the same and it's not an error or "End Result"
                    if ctr_line != res_line:
                        words1 = ctr_line.split()
                        words2 = res_line.split()
                        
                        word_matcher = difflib.SequenceMatcher(None, words1, words2)
                        line_num = i1 + line_idx + 1  # 1-based line numbering
                        
                        for wtag, wi1, wi2, wj1, wj2 in word_matcher.get_opcodes():
                            if wtag == 'equal':
                                continue
                            elif wtag == 'insert':
                                for idx, word in enumerate(words2[wj1:wj2]):
                                    add_error(f"Line {line_num}, extra word at position {wj1 + idx + 1}: '{word}'")
                            elif wtag == 'delete':
                                for idx, word in enumerate(words1[wi1:wi2]):
                                    add_error(f"Line {line_num}, missing word at position {wi1 + idx + 1}: '{word}'")
                            elif wtag == 'replace':
                                for k in range(min(wi2 - wi1, wj2 - wj1)):
                                    add_error(f"Line {line_num}, word {wi1 + k + 1}: expected '{words1[wi1 + k]}', got '{words2[wj1 + k]}'")
            
            # Handle extra lines in the replace block
            if (i2 - i1) > (j2 - j1):
                for idx in range(j2-j1, i2-i1):
                    add_error(f"Extra line {i1 + idx + 1} in {ctr_file}: {lines1[i1 + idx].strip()}")
            elif (j2 - j1) > (i2 - i1):
                for idx in range(i2-i1, j2-j1):
                    add_error(f"Extra line {j1 + idx + 1} in {res_file}: {lines2[j1 + idx].strip()}")
                    
        elif tag == 'delete':
            # Lines only in the control file
            for idx in range(i1, i2):
                ctr_line = lines1[idx].strip()  # Fixed: use idx directly, not i1 + idx
                match = query_number_pattern.match(ctr_line)
                if match:
                    current_query = f"Query #{match.group(1)}:"  # Format to match expected output
                add_error(f"Extra line {idx + 1} in {ctr_file}: {lines1[idx].strip()}")  # Fixed: use idx directly
                
        elif tag == 'insert':
            # Lines only in the result file
            for idx in range(j1, j2):
                res_line = lines2[idx].strip()  # Fixed: use idx directly, not j1 + idx
                match = query_number_pattern.match(res_line)
                if match:
                    current_query = f"Query #{match.group(1)}:"  # Format to match expected output
                add_error(f"Extra line {idx + 1} in {res_file}: {lines2[idx].strip()}")  # Fixed: use idx directly

        ctr_line_index = i2
        res_line_index = j2

    # Filter out queries with no errors
    errors_by_query = {query: errors for query, errors in errors_by_query.items() if errors}

    if errors_by_query:
        with open(diff_file, 'w', encoding='utf-8') as df:
            for query, errors in errors_by_query.items():
                if not errors:  # Skip queries with no errors
                    continue
                    
                # Extract and format the query number for display
                if query and query != "Unknown Query":
                    # No need to re-match, current_query is already formatted
                    df.write(f"{query}\n") 
                else:
                    df.write(f"{query}\n")

                for err in errors:
                    df.write(err + '\n')
                df.write("\n")  # Add a newline between queries
        print(f"Differences written to {diff_file}")
    else:
        print(f"No differences found. {ctr_file} and {res_file} match perfectly.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 compare_files.py <base_filename>")
    else:
        compare_files(sys.argv[1])
