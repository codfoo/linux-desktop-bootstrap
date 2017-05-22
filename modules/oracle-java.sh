#!/bin/bash

# name = "NodeJS LTS"
# supported_versions = "lts 6.10.3"
# description = "Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient."

_run_8u131() {
    $DEBUG cd  ~/Downloads
    $DEBUG wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

    $DEBUG sudo tar -xvf ~/Downloads/jdk-*-linux-x64.tar.gz
    $DEBUG sudo mkdir -p /usr/lib/jvm/
    $DEBUG sudo mv jdk1* /usr/lib/jvm/oracle_jdk

    $DEBUG sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/oracle_jdk/bin/java 2800
	$DEBUG sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/oracle_jdk/bin/javac 2800
	$DEBUG sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/oracle_jdk/bin/javaws 2800
	$DEBUG sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/oracle_jdk/bin/jar 2800
	$DEBUG sudo update-alternatives --install /usr/bin/javadoc javadoc /usr/lib/jvm/oracle_jdk/bin/javadoc 2800
	$DEBUG sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/oracle_jdk/bin/javap 2800
}

_run_latest() {
    _run_8u131
}

_run_() {
    _run_latest
}

# TODO
if $(which _run_$1); then
    echo "ERROR: $0 Version $1 is not available."
    exit;
fi

_run_$1
