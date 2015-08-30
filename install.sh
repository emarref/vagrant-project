#!/usr/bin/env bash
DEST_DIR=`pwd`
CONFIG_DIR="${DEST_DIR}/app/config/vm"

curl -o /tmp/symfony.zip -L https://github.com/emarref/vagrant-project/archive/symfony.zip

unzip -j /tmp/symfony.zip "vagrant-project-symfony/Vagrantfile" -d "$DEST_DIR"

[ ! -d "$CONFIG_DIR" ] && mkdir -p "$CONFIG_DIR"
unzip -j /tmp/symfony.zip "vagrant-project-symfony/app/config/vm/*" -d "$CONFIG_DIR"
