#!/bin/bash

# name = "NodeJS LTS"
# supported_versions = "lts 6.10.3"
# description = "Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient."

_run_6.10.3() {
    $DEBUG cd  ~/Downloads
    $DEBUG wget https://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-x64.tar.xz

    $DEBUG cd /usr/local/
    $DEBUG sudo tar --strip-components=1 -xvf ~/Downloads/node-v*-linux-x64.tar.xz
}

_run_lts() {
    _run_6.10.3
}

_run_() {    
    _run_6.10.3
}

# TODO
if $(which _run_$1); then
    echo "ERROR: $0 Version $1 is not available."
    exit;
fi

_run_$1
