#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {
    # Commands
    $DEBUG sudo apt-get install -y --force-yes git-cola
}

_run_() {
    _run_default
}

# TODO
if $(which _run_$1); then
    echo "ERROR: $0 Version $1 is not available."
    exit;
fi

_run_$1
