#!/bin/bash
OUTPUT_LOG="./testLog"

LAST_LOG-"/Library/Logs/ArqAgent/$(ls -1tr /Library/Logs/ArqAgent/ | tail -n 1)"


/bin/cat $LAST_LOG > $OUTPUT_LOG

#if grep -Eq 'Error|Errors' $OUTPUT_LOG; then
#  echo true
#else
#  echo false
#fi

#exit 0