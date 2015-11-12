#!/usr/bin/env bash

set -e
set -o pipefail
set -x

mkdir /tmp/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/virtualbox
cd /tmp/virtualbox
REMOVE_INSTALLATION_DIR=0 ./VBoxLinuxAdditions.run
rm -f /home/vagrant/*.iso
