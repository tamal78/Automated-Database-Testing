#!/bin/bash

# This script automates the database testing workflow.
# It takes a single argument: the name of the SQL file.
# Version 2: Adjusted for comparator.py argument style.

# --- Validation ---
# Check if an argument (the SQL file) is provided.
if [ -z "$1" ]; then
  echo "Usage: $0 [filename].sql"
  exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Extract the base filename without the .sql extension.
# For example, from "test_query.sql", this will get "test_query".
FILENAME=$(basename "$1" .sql)

# --- Step 1: Generate the .res file ---
# Run the auto.sh script with the provided SQL file.
echo "Running auto.sh for $1..."
# Ensure auto.sh is executable
if [ -x "./auto.sh" ]; then
    ./auto.sh "$1" ${FILENAME}.res
else
    bash ./auto.sh "$1" ${FILENAME}.res
fi
echo "Generated ${FILENAME}.res"
echo "---------------------------------"

# --- Step 2: Compare and create the .diff file ---
# Run the comparator.py script.
# It now takes the base filename as its only argument.
echo "Running comparator.py..."
python3 comparator.py "${FILENAME}"
echo "Generated ${FILENAME}.diff (if differences were found)"
echo "---------------------------------"

# --- Step 3: Analyze the .diff and create a summary ---
# Run the analyzer.py script to analyze the .diff file.
# This assumes analyzer.py takes the .diff file as an argument.
echo "Running analyzer.py..."
python3 analyzer.py "${FILENAME}.diff"
echo "Generated ${FILENAME}_analysis.txt"
echo "---------------------------------"

echo "✅ All steps completed!"
