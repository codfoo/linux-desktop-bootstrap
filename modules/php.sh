#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {
    # Commands
    $DEBUG sudo apt-get install -y --allow php-cli php-dev php-sqlite3 php-gd \
    			php-curl php-memcached php-imap php-mysql php-mbstring php-soap \
    			php-bcmath php-xml php-zip php-intl php-readline php-mcrypt
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
