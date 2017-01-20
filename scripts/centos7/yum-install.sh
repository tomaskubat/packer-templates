#!/usr/bin/env bash

set -e
set -o pipefail
set -x

# EPEL repository
#rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Base Packages
yum -y install \
    git \
    vim-enhanced \
    htop \
    screen \
    mc
