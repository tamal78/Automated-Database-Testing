#!/bin/bash

# This script automates the database testing workflow.
# It takes a single argument: the name of the SQL file.
# Updated to use dedicated folder directories for inputs and outputs.

# --- Folder Configuration ---
SQL_DIR="./features"
CONTROL_DIR="./control_files"
RES_DIR="./results"
DIFF_DIR="./diffs"
ANALYSIS_DIR="./analysis"

# Create output folders if they don’t exist to prevent errors
mkdir -p "$RES_DIR" "$DIFF_DIR" "$ANALYSIS_DIR"

# --- Validation ---
# Check if an argument (the SQL file) is provided.
if [ -z "$1" ]; then
  echo "Usage: $0 [filename].sql"
  exit 1
fi

# --- File Path Configuration ---
FILENAME=$(basename "$1" .sql)
SQL_FILE="${SQL_DIR}/$1"
CONTROL_FILE="${CONTROL_DIR}/${FILENAME}.ctr" # Assuming control file has .ctr extension
RES_FILE="${RES_DIR}/${FILENAME}.res"
DIFF_FILE="${DIFF_DIR}/${FILENAME}.diff"
ANALYSIS_FILE="${ANALYSIS_DIR}/${FILENAME}_analysis.txt"

# Check if the provided .sql file exists in the Features directory
if [ ! -f "$SQL_FILE" ]; then
    echo "Error: SQL file '$SQL_FILE' not found."
    exit 1
fi

# Check if the corresponding control file exists in the Control_files directory
if [ ! -f "$CONTROL_FILE" ]; then
    echo "Error: Control file '$CONTROL_FILE' not found."
    exit 1
fi


# --- Step 1: Generate the .res file ---
# Run the auto.sh script with the full path to the SQL file and the target results file.
echo "Running auto.sh for $SQL_FILE..."
if [ -x "./auto.sh" ]; then
    ./auto.sh "$SQL_FILE" "$RES_FILE"
else
    bash ./auto.sh "$SQL_FILE" "$RES_FILE"
fi
echo "Generated ${RES_FILE}"
echo "---------------------------------"

# --- Step 2: Compare and create the .diff file ---
# Run the comparator.py script.
# It now takes the .res, .ctr, and .diff file paths as arguments for clarity.
echo "Running comparator.py..."
python3 comparator.py "${FILENAME}" "${DIFF_FILE}"
echo "Generated ${DIFF_FILE} (if differences were found)"
echo "---------------------------------"

# --- Step 3: Analyze the .diff and create a summary ---
# Run the analyzer.py script.
# It now takes the .diff file path and the target analysis file path as arguments.
echo "Running analyzer.py..."
python3 analyzer.py "$DIFF_FILE" "$ANALYSIS_FILE"
echo "Generated ${ANALYSIS_FILE}"
echo "---------------------------------"

echo "✅ All steps completed!"
