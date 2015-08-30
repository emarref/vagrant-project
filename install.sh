#!/usr/bin/env bash
DEST_DIR=`pwd`
CONFIG_DIR="${DEST_DIR}/app/config/vm"

curl -o /tmp/vagrant-project.zip -L https://github.com/emarref/vagrant-project/archive/master.zip

unzip -o -j /tmp/vagrant-project.zip "vagrant-project-master/Vagrantfile" -d "$DEST_DIR"

[ ! -d "$CONFIG_DIR" ] && mkdir -p "$CONFIG_DIR"
unzip -o -j /tmp/vagrant-project.zip "vagrant-project-master/app/config/vm/*" -d "$CONFIG_DIR"
