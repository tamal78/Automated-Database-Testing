#!/bin/bash
# (This is the SEQUENTIAL runner)

# This script automates the database testing workflow.
# It first generates all required .diff files.
# Then, it runs the analyzer on each file one-by-one and times the total duration.

# --- Folder Configuration ---
SQL_DIR="./features"
CONTROL_DIR="./control_files"
RES_DIR="./results"
DIFF_DIR="./diffs"
ANALYSIS_DIR="./analysis"

# Create output folders if they don’t exist to prevent errors
mkdir -p "$RES_DIR" "$DIFF_DIR" "$ANALYSIS_DIR"

# --- File Selection Logic ---
# Declare an array to hold the basenames of the files to be processed.
declare -a BASENAMES_TO_PROCESS

# If no arguments are provided, find all .sql files in the SQL_DIR.
# Otherwise, use the provided arguments.
if [ "$#" -eq 0 ]; then
    echo "No arguments given. Automatically finding all .sql files in ${SQL_DIR}..."
    # Find all .sql files, get their basenames without the extension, and add to the array
    for sql_file in "${SQL_DIR}"/*.sql; do
        if [ -e "$sql_file" ]; then # Check if file exists to handle cases where no *.sql files are found
            BASENAMES_TO_PROCESS+=("$(basename "$sql_file" .sql)")
        fi
    done
    
    # Validate that files were actually found
    if [ ${#BASENAMES_TO_PROCESS[@]} -eq 0 ]; then
        echo "❌ Error: No .sql files found in '${SQL_DIR}'. Exiting."
        exit 1
    fi
    echo "Found ${#BASENAMES_TO_PROCESS[@]} files to process."
else
    # If arguments are provided, use them directly.
    echo "Arguments provided. Processing the specified files..."
    BASENAMES_TO_PROCESS=("$@")
fi


# --- Main Processing (Steps 1 & 2) ---
# Declare an array to hold the paths of all generated diff files for final analysis.
declare -a DIFF_FILES_TO_ANALYZE=()

# Loop over all selected basenames to generate diffs first.
for FILENAME in "${BASENAMES_TO_PROCESS[@]}"; do
    echo "========================================"
    echo "▶️  Preprocessing: $FILENAME"
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
    # The > /dev/null redirection cleans up the output from this step
    bash ./auto.sh "$SQL_FILE" "$RES_FILE" > /dev/null
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
done # End of the preprocessing loop

# --- Step 3: Analyze all .diff files one-by-one (Sequential Method) ---
if [ ${#DIFF_FILES_TO_ANALYZE[@]} -eq 0 ]; then
  echo "No diff files were generated. Skipping analysis."
else
    echo "========================================"
    echo "🔬 Timing Sequential Analysis (looping through each file)"
    echo "========================================"

    # Use 'time' to measure the entire loop block. The parentheses create a subshell.
    time (
      for diff_file in "${DIFF_FILES_TO_ANALYZE[@]}"; do
          FILENAME=$(basename "$diff_file" .diff)
          ANALYSIS_FILE="${ANALYSIS_DIR}/${FILENAME}_sequential_report.txt"
          echo "  -> Analyzing $diff_file..."
          # --- MODIFIED CALL ---
          python3 analyzer.py "$diff_file" \
              -o "$ANALYSIS_FILE" \
              --title "SEQUENTIAL ANALYSIS: $FILENAME" \
              --quiet
      done
    )
    
    echo "✅ Generated individual sequential reports in ${ANALYSIS_DIR}"
fi

echo "----------------------------------------"
echo "✅ All steps completed!"
