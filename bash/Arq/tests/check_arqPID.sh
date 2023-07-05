#!/usr/bin/env bash

PROCESS_NAME="Arq"
if pgrep $PROCESS_NAME; then
    echo "Running";
fi

exit 0

#Checks for any and ALL Arq processes - ArqAgent and ArqMonitor AND returns related PIDs
#if one or the other is running it will return Running