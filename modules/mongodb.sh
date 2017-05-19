#!/bin/bash

# name = ""
# supported_versions = ""
# description = ""

_run_3.4() {
    # Commands
    $DEBUG sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
	$DEBUG sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
	if [[ ! -z "$DEBUG" ]]; then
		echo '"deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list'
	else
		echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
	fi
	$DEBUG sudo apt-get update
	$DEBUG sudo apt-get install --force-yes -y mongodb-org
	$DEBUG sudo service mongod start
	$DEBUG sudo service mongod stop
	$DEBUG sudo service mongod restart
}

_run_() {
    _run_3.4
}

# TODO
if $(which _run_$1); then
    echo "ERROR: $0 Version $1 is not available."
    exit;
fi

_run_$1
