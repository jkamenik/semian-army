#!/bin/bash

# Hack that gets us the directory of the current file
export LOAD_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
$LOAD_PATH/bin/run.sh $@
