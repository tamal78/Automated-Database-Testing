#!/bin/bash

# --- Configuration: Enter your database details here ---
DB_HOST="localhost"
DB_USER="admin"
DB_PASS="password"
# ---------------------------------------------------------

SQL_FILE="$1"
OUTPUT_FILE="$2"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Still a good idea to be aware of the security risk of plain-text passwords.
# A MySQL option file (~/.my.cnf) is the most secure method.

if [ -z "$SQL_FILE" ]; then
    echo -e "${RED}Error: No SQL file provided.${NC}"
    echo "Usage: $0 <sql_file> [output_file]"
    exit 1
fi

if [ ! -f "$SQL_FILE" ]; then
    echo -e "${RED}Error: SQL file '$SQL_FILE' not found.${NC}"
    exit 1
fi

if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="output.txt"
    echo -e "${YELLOW}Warning: No output file specified. Using default '$OUTPUT_FILE'.${NC}"
fi

> "$OUTPUT_FILE"

DB_NAME=$(sed -n -e 's/^[[:space:]]*USE[[:space:]]\+\([^;[:space:]]*\).*/\1/pI' -e q "$SQL_FILE" | tr -d '\r')

if [ -z "$DB_NAME" ]; then
    echo -e "${RED}Error: Could not extract database name from the first 'USE' statement in '$SQL_FILE'.${NC}"
    echo "Please ensure the file starts with a 'USE database_name;' statement." >> "$OUTPUT_FILE"
    exit 1
fi

echo "Using database: $DB_NAME"
echo "Using database: $DB_NAME" >> "$OUTPUT_FILE"
echo >> "$OUTPUT_FILE"

TEMP_QUERY=$(mktemp)
trap 'rm -f "$TEMP_QUERY"' EXIT

QUERY_COUNT=0
SUCCESS_COUNT=0
FAILURE_COUNT=0
CURRENT_HEADER=""
ACCUMULATING=false

while IFS= read -r line || [ -n "$line" ]; do
    trimmed_line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ "$trimmed_line" =~ ^-- ]] && ! $ACCUMULATING; then
        CURRENT_HEADER="$trimmed_line"
        continue
    fi

    if [[ -z "$trimmed_line" ]]; then
        continue
    fi

    if [[ "$trimmed_line" =~ ^USE[[:space:]]+ ]]; then
        continue
    fi

    if ! $ACCUMULATING && [[ -n "$trimmed_line" ]]; then
        ACCUMULATING=true
    fi

    echo "$line" >> "$TEMP_QUERY"

    if [[ "$trimmed_line" == *\; ]]; then
        ((QUERY_COUNT++))

        if [[ -n "$CURRENT_HEADER" ]]; then
            echo "$CURRENT_HEADER" >> "$OUTPUT_FILE"
        fi

        echo "--- Result ---" >> "$OUTPUT_FILE"

        START_TIME=$(date +%s.%N)

        # MODIFIED: Use MYSQL_PWD environment variable to provide the password.
        # This removes the command-line warning. Note the -p flag is now gone.
        if export MYSQL_PWD="$DB_PASS"; mysql -h"$DB_HOST" -u"$DB_USER" -D "$DB_NAME" -B < "$TEMP_QUERY" >> "$OUTPUT_FILE" 2>> "$OUTPUT_FILE"; then
            END_TIME=$(date +%s.%N)
            EXEC_TIME=$(echo "$END_TIME - $START_TIME" | bc)
            EXEC_TIME=$(printf "%.4f" "$EXEC_TIME")
            echo -e "${GREEN}✓ Query $QUERY_COUNT Successful in ${EXEC_TIME} seconds:${NC} ${CURRENT_HEADER#-- }"
            ((SUCCESS_COUNT++))
            echo "--- End Result (Success) ---" >> "$OUTPUT_FILE"
        else
            END_TIME=$(date +s.%N)
            EXEC_TIME=$(echo "$END_TIME - $START_TIME" | bc)
            EXEC_TIME=$(printf "%.4f" "$EXEC_TIME")
            MYSQL_ERROR_CODE=$?
            echo -e "${RED}✗ Query $QUERY_COUNT Failed (Exit Code: $MYSQL_ERROR_CODE) in ${EXEC_TIME} seconds:${NC} ${CURRENT_HEADER#-- }"
            ((FAILURE_COUNT++))
            echo "--- End Result (Failure) ---" >> "$OUTPUT_FILE"
        fi

        echo "" >> "$OUTPUT_FILE"
        echo "==============================" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        > "$TEMP_QUERY"
        CURRENT_HEADER=""
        ACCUMULATING=false
    fi
done < "$SQL_FILE"

if $ACCUMULATING && [ -s "$TEMP_QUERY" ]; then
    echo -e "${YELLOW}Warning: SQL file appears to end with an incomplete query. Trailing content ignored:${NC}"
    echo "--- Ignored Trailing Content ---" >> "$OUTPUT_FILE"
    cat "$TEMP_QUERY" >> "$OUTPUT_FILE"
    echo "--- End Ignored Content ---" >> "$OUTPUT_FILE"
fi

echo ""
echo -e "${YELLOW}Query Execution Summary:${NC}"
echo -e "Total Queries Processed: ${QUERY_COUNT}"
echo -e "${GREEN}Successful Queries: ${SUCCESS_COUNT}${NC}"
echo -e "${RED}Failed Queries: ${FAILURE_COUNT}${NC}"
echo -e "Output logged to: ${YELLOW}$OUTPUT_FILE${NC}"

if [ $FAILURE_COUNT -gt 0 ]; then
    exit 1
fi

exit 0
