#!/usr/bin/env bash

PROCESS="Arq"

if ps ax | grep -v grep | grep "${PROCESS}" &> /dev/null; then
    echo "true"
else
    echo "false"
fi

exit 0

#Checks for any and ALL Arq processes - ArqAgent and ArqMonitor
#if one or the other is running it will return Running
 
