#!/bin/bash

LOG_DIR="/Users/suyashpandey/Danger/photos/new/shell-scripting/logs"
APP_LOG="application.log"
SYS_LOG="system.log"
REPORT_FILE="/Users/suyashpandey/Danger/photos/new/shell-scripting/logs/log_analysis_report.txt"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "Analysing log file" >> "${REPORT_FILE}"
echo "==================" >> "${REPORT_FILE}"

echo -e  "\nList of log files updated in 24hrs" >> "${REPORT_FILE}"
LOG_FILES=$(find $LOG_DIR -name  "*.log" -mtime -1)
echo "$LOG_FILES" >> "${REPORT_FILE}"

for LOG_FILE in $LOG_FILES; do
    echo -e "/n" >> "${REPORT_FILE}"
    echo "===========================================================" >> "${REPORT_FILE}"
    echo "===========$LOG_FILE==========" >> "${REPORT_FILE}"
    echo "===========================================================" >> "${REPORT_FILE}"

    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo -e  "\nSearching $PATTERN in $LOG_FILE file" >> "${REPORT_FILE}"
        grep "$PATTERN" "$LOG_FILE" >> "${REPORT_FILE}"

        echo -e  "\nNumber of $PATTERN logs in $LOG_FILE" >> "${REPORT_FILE}"
        ERROR_COUNT=$(grep -c "${PATTERN}" "${LOG_FILE}")
        echo "${ERROR_COUNT}" >> "${REPORT_FILE}"

        if [ ${ERROR_COUNT} -gt 10 ]; then
            echo -e "\n ⚠️ ACTION REQUIRED : too many ${PATTERN} issues in log file ${LOG_FILE}"
        fi

    done
done

echo -e "\nLOG ANALYSIS COMPLETED AND REPORT SAVED IN ${REPORT_FILE}"