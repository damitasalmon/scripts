#!/bin/sh
OUTPUT_LOG="/tmp/arqLog"

/bin/cat /Library/Application\ Support/ArqAgent/logs/backup/$(ls -1tr /Library/Application\ Support/ArqAgent/logs/backup/ | tail -n 1) > $OUTPUT_LOG
#if you find these words, all good. Else Backup failure.
if grep -q 'Error|Errors' $OUTPUT_LOG; then
  echo true
else
    echo false
fi

exit 0