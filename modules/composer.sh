#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {

    if [[ ! -z "$DEBUG" ]]; then
		echo 'curl -sS https://getcomposer.org/installer | php'
	else
		curl -sS https://getcomposer.org/installer | php
	fi

	$DEBUG sudo mv composer.phar /usr/local/bin/composer
	$DEBUG sudo chmod a+x /usr/local/bin/composer
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
