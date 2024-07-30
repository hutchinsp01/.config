#!/bin/bash

CURRENT_PATH=$(pwd)

if [ ! -d ".venv" ]; then
    python -m venv $CURRENT_PATH/.venv
    echo "Virtual environment (.venv) created in $CURRENT_PATH"
else
    echo "Virtual environment (.venv) already exists in $CURRENT_PATH"
fi

