#!/bin/bash

# Define the source and destination directories
FEATURES_DIR="features"
CONTROL_DIR="control_files"
AUTO_SCRIPT="./auto.sh"

# ANSI color codes for colorful output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if the auto.sh script exists and is executable
if [ ! -x "$AUTO_SCRIPT" ]; then
    echo -e "${RED}Error: The main script '$AUTO_SCRIPT' was not found or is not executable.${NC}"
    echo "Please ensure '$AUTO_SCRIPT' is in the current directory and has execute permissions (chmod +x $AUTO_SCRIPT)."
    exit 1
fi

# Check if any file arguments were provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: No SQL file basenames provided.${NC}"
    echo "Usage: $0 <file1_basename> <file2_basename> ..."
    echo "Example: $0 aggregation filtering joins_unions"
    exit 1
fi

# Create the Features and Control_files directories if they don't already exist
mkdir -p "$FEATURES_DIR"
mkdir -p "$CONTROL_DIR"

echo -e "${YELLOW}Starting control file generation process...${NC}"
echo "Source directory:      '${FEATURES_DIR}/'"
echo "Destination directory: '${CONTROL_DIR}/'"
echo "------------------------------------------------"

# Loop through all the file basenames passed as command-line arguments
for basename in "$@"
do
    SQL_FILE="${FEATURES_DIR}/${basename}.sql"
    # --- THIS IS THE MODIFIED LINE ---
    OUTPUT_FILE="${CONTROL_DIR}/${basename}.ctr"

    echo -e "Processing '${basename}'..."

    # Check if the source SQL file exists
    if [ ! -f "$SQL_FILE" ]; then
        echo -e "  ${RED}✗ Error: SQL file not found at '${SQL_FILE}'${NC}"
        continue
    fi

    # Run the auto.sh script with the specified input and output files
    # The output of auto.sh will be displayed directly to the console by the script itself.
    "$AUTO_SCRIPT" "$SQL_FILE" "$OUTPUT_FILE"

    # Check the exit code of the auto.sh script to confirm its own success or failure
    if [ $? -eq 0 ]; then
        echo -e "  ${GREEN}✓ Successfully generated control file: '${OUTPUT_FILE}'${NC}"
    else
        echo -e "  ${RED}✗ Failed to process '${SQL_FILE}'. Check output above for details.${NC}"
    fi
    echo "------------------------------------------------"
done

echo -e "${GREEN}All files processed.${NC}"
