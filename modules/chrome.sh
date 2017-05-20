#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {
    $DEBUG cd ~/Downloads
    $DEBUG wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $DEBUG sudo dpkg -i google-chrome-stable_current_amd64.deb
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
