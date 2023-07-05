#!/usr/bin/env bash

PROCESS="Arq"

if pgrep -xq -- "${PROCESS}"; then
    echo "true"
else
    echo "false"
fi

exit 0
#Checks for Arq Agent ONLY