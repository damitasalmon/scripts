#!/usr/bin/env bash

# Ends with success (green) if the device has Arq installed AND ArqMonitor is running OR if Arq is not installed.
# Exits with failure (red) if Arq is installed and ArqMonitor is not running.

if [ -e /Applications/Arq.app ]; then
    if ps ax | grep -v grep | grep "Arq" &> /dev/null ; then
        echo "true"
        exit 0
    else
        echo "false"
        exit 1
    fi
else 
    echo "If you'd like to make a call, please hang up and try again. If you need help, hang up and then dial your operator."
    exit 0
fi