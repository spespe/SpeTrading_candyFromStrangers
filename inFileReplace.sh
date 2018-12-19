#!/bin/bash
##CREATED BY: PIETRO SPERI

FILE=$1
PATTERN=$2
SUB=$3
OCCURR=$4
LOG_FILE=${0}_INFO.log

if [[ $# -lt 4 ]]; then
        echo "NUMBER OF ARGUMENTS WRONG."
        echo "USAGE: sh ${0} [FILE] [PATTERN TO SUBSTITUTE] [OCCURRENCE NUMBER] [SUBSTITUTION STRING]"
        exit 1
fi

if [[ ! -f ${FILE} ]]; then
        echo "[  THE FILE SPECIFIED DOES NOT EXIST ]" | tee -a ${LOG_FILE}
fi

DATE=`date +%Y/%m/%d" "%H:%M:%S`
REPLACE=`sed -i "s/${PATTERN}/${SUB}/${OCCURR}" ${FILE}`
S=$?
if [[ ${S} != 0 ]]; then
        echo "[ ${DATE} ] [ ERROR ENCOUNTERED WHILE EXECUTING THE SED COMMAND ] [ FILE: ${FILE} - PATTERN: ${PATTERN} - SUBSTITUTION: ${SUB} - OCCURRENCE NUMBER: ${OCCURR} ]" | tee -a ${LOG_FILE}
        exit 1
fi
