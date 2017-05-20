#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_default() {
    $DEBUG sudo apt-get install -y --force-yes pkg-config libcurl4-openssl-dev \
    		libssl-dev libsslcommon2-dev

    $DEBUG sudo pecl install mongodb

    php_version="$(php -v | grep -oP 'PHP [0-9]+\.[0-9]+' | grep -oP '[0-9\.]+')"

    if [[ ! -z "$DEBUG" ]]; then
        echo 'echo "extension=mongodb.so" > /etc/php/${php_version}/apache2/conf.d/30-mongodb.ini'
        echo 'echo "extension=mongodb.so" > /etc/php/${php_version}/cli/conf.d/30-mongodb.ini'
        echo 'echo "extension=mongodb.so" > /etc/php/${php_version}/fpm/conf.d/30-mongodb.ini'
    else
        which apache2 && sudo echo "extension=mongodb.so" | sudo tee /etc/php/${php_version}/apache2/conf.d/30-mongodb.ini
	sudo echo "extension=mongodb.so" | sudo tee /etc/php/${php_version}/cli/conf.d/30-mongodb.ini
	which php-fpm${php_version} && sudo echo "extension=mongodb.so" | sudo tee /etc/php/${php_version}/fpm/conf.d/30-mongodb.ini
    fi

    $DEBUG which apache2 && sudo systemctl reload apache2
    $DEBUG which nginx && sudo systemctl reload nginx
    $DEBUG which php-fpm${php_version} && sudo systemctl restart php7.0-fpm
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
