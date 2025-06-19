#!/bin/bash

# This script automates the database testing workflow.
# If called with no arguments, it runs for all .sql files in the 'features' directory.
# If called with arguments (e.g., "aggregation", "filtering"), it runs only for those files.

# --- Folder Configuration ---
SQL_DIR="./features"
CONTROL_DIR="./control_files"
RES_DIR="./results"
DIFF_DIR="./diffs"
ANALYSIS_DIR="./analysis"

# Create output folders if they don’t exist to prevent errors
mkdir -p "$RES_DIR" "$DIFF_DIR" "$ANALYSIS_DIR"

# --- Argument Handling ---
# Declare an array to hold the basenames of the files to be processed.
declare -a FILES_TO_PROCESS=()

# If no arguments are provided, find all .sql files in the features directory.
if [ "$#" -eq 0 ]; then
  echo "No specific files provided. Discovering all .sql files in '${SQL_DIR}'..."
  
  # Check if the directory is empty or has no .sql files to prevent errors.
  if ! ls "${SQL_DIR}"/*.sql &> /dev/null; then
      echo "No .sql files found in '${SQL_DIR}'. Exiting."
      exit 1
  fi
  
  # Loop through all .sql files and add their basenames (without extension) to the list.
  for sql_file in "${SQL_DIR}"/*.sql; do
    FILES_TO_PROCESS+=("$(basename "$sql_file" .sql)")
  done
else
  # If arguments are provided, use them as the list of files to process.
  echo "Running for specified files: $@"
  FILES_TO_PROCESS=("$@")
fi


# --- Main Processing ---
# Declare an array to hold the paths of all generated diff files for final analysis.
declare -a DIFF_FILES_TO_ANALYZE=()

# Loop over the collected basenames. This now works for both modes.
for FILENAME in "${FILES_TO_PROCESS[@]}"; do
    echo "========================================"
    echo "▶️  Processing: $FILENAME"
    echo "========================================"

    # --- File Path Configuration ---
    SQL_FILE="${SQL_DIR}/${FILENAME}.sql"
    CONTROL_FILE="${CONTROL_DIR}/${FILENAME}.ctr"
    RES_FILE="${RES_DIR}/${FILENAME}.res"
    DIFF_FILE="${DIFF_DIR}/${FILENAME}.diff"

    # --- File Validation ---
    if [ ! -f "$SQL_FILE" ]; then
        echo "❌ Error: SQL file '$SQL_FILE' not found. Skipping."
        continue # Skip to the next filename
    fi

    if [ ! -f "$CONTROL_FILE" ]; then
        echo "❌ Error: Control file '$CONTROL_FILE' not found. Skipping."
        continue # Skip to the next filename
    fi

    # --- Step 1: Generate the .res file ---
    echo "Running auto.sh for $SQL_FILE..."
    if [ -x "./auto.sh" ]; then
        ./auto.sh "$SQL_FILE" "$RES_FILE"
    else
        bash ./auto.sh "$SQL_FILE" "$RES_FILE"
    fi
    echo "Generated ${RES_FILE}"
    echo "----------------------------------------"

    # --- Step 2: Compare and create the .diff file ---
    echo "Running comparator.py..."
    python3 comparator.py "${FILENAME}" "${DIFF_FILE}"
    echo "Generated ${DIFF_FILE}"
    
    # Add the newly created diff file to our list for final analysis.
    if [ -f "$DIFF_FILE" ]; then
        DIFF_FILES_TO_ANALYZE+=("$DIFF_FILE")
    else
        echo "⚠️ Warning: Diff file was not created for $FILENAME. It will be skipped."
    fi
done # End of the main loop

# --- Step 3: Analyze all .diff files together (Parallel Method) ---
if [ ${#DIFF_FILES_TO_ANALYZE[@]} -eq 0 ]; then
  echo "No diff files were generated. Skipping final analysis."
else
    echo "========================================"
    echo "🔬 Timing Parallel Analysis (one process for all files)"
    echo "========================================"
    
    COMBINED_ANALYSIS_FILE="${ANALYSIS_DIR}/parallel_analysis_report.txt"
    
    # Use the 'time' command to measure the performance of the analyzer script
    # The command is run inside a subshell `()` to time it accurately.
    time (python3 analyzer.py "${DIFF_FILES_TO_ANALYZE[@]}" \
        -o "$COMBINED_ANALYSIS_FILE" \
        --title "COMBINED PARALLEL ANALYSIS")
    
    # Check if the command was successful before printing success message
    if [ $? -eq 0 ]; then
        echo "✅ Generated parallel analysis report: ${COMBINED_ANALYSIS_FILE}"
    else
        echo "❌ Error: Failed to generate the parallel analysis report."
    fi
fi

echo "----------------------------------------"
echo "✅ All steps completed!"
