#!/bin/bash
SERVICE='Arq'

if ps ax | grep -v grep | grep "${SERVICE}" &> /dev/null; then
    echo running
else
    echo not running
fi