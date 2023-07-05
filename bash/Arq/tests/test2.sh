#!/usr/bin/env bash

# Ends with success (green) if the device has Arq installed AND ArqMonitor is running.
# Exits with failure (red) if Arq is installed and ArqMonitor is not running OR if Arq is NOT installed.

if [ -e /Applications/Arq.app ]; then
    if ps ax | grep -v grep | grep "Arq" &> /dev/null ; then
        echo "Arq is Installed and ArqMonitor is Running"
        exit 0
    else
        echo "Arq is installed but not Running"
        exit 1
    fi
else 
    echo "Arq is not installed."
    exit 1
fi