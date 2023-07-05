#!/bin/bash

SERVICE='Arq'

if pgrep -xq -- "${SERVICE}"; then
    echo running
else
    echo not running
fi

#Checks for Arq Agent ONLY