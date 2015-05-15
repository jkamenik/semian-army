#!/bin/bash

# Hack that gets us the directory of the current file
LOAD_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
source $LOAD_PATH/bin/run.sh
