#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {
    $DEBUG cd ~/Downloads
    $DEBUG wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
    $DEBUG sudo dpkg -i sublime-text_build-*_amd64.deb
    $DEBUG sudo apt-get -f -y install
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
