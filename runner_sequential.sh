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

# --- Validation ---
# Check if at least one argument is provided.
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 [basename1] [basename2] ..."
  echo "Example: $0 aggregation filtering select"
  exit 1
fi

# --- Main Processing (Steps 1 & 2) ---
# Declare an array to hold the paths of all generated diff files for final analysis.
declare -a DIFF_FILES_TO_ANALYZE=()

# Loop over all basenames provided as arguments to generate diffs first.
for FILENAME in "$@"; do
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
          python3 analyzer.py "$diff_file" \
              -o "$ANALYSIS_FILE" \
              --title "SEQUENTIAL ANALYSIS: $FILENAME"
      done
    )
    
    echo "✅ Generated individual sequential reports in ${ANALYSIS_DIR}"
fi

echo "----------------------------------------"
echo "✅ All steps completed!"
