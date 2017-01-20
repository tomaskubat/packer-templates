#!/usr/bin/env bash

set -e
set -o pipefail
set -x

# Cleanup
yum -y remove \
    selinux* \
    vim-enhanced vim-common vim-filesystem \
    git \
    tuned \
    smartmontools \
    polkit \
    lvm2 \
    lvm2-libs
