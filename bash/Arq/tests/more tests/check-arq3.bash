#!/bin/bash
PROCESS_NAME='Arq'
if pgrep $PROCESS_NAME; then
    echo 'Running';
else
    echo "Not Running"
fi
