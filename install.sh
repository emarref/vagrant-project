#!/usr/bin/env bash
DEST_DIR=`pwd`
CONFIG_DIR="${DEST_DIR}/app/config/vm"

# Download the master branch as a zip archive to a temp dir
curl -o /tmp/vagrant-project.zip -L https://github.com/emarref/vagrant-project/archive/master.zip

# Extract the Vagrant file from the zip archive to the root of your project dir
unzip -o -j /tmp/vagrant-project.zip "vagrant-project-master/Vagrantfile" -d "$DEST_DIR"

# Create the config dir, and extract the config files to it
[ ! -d "$CONFIG_DIR" ] && mkdir -p "$CONFIG_DIR"
unzip -o -j /tmp/vagrant-project.zip "vagrant-project-master/app/config/vm/*" -d "$CONFIG_DIR"
