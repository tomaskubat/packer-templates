#!/usr/bin/env bash

set -e
set -o pipefail
set -x

# Cleanup
yum -y remove \
    selinux* \
    tuned \
    smartmontools \
    polkit \
    lvm2 \
    lvm2-libs

# RPM Forge repository
rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

# EPEL repository
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# WEBSTATIC repository (PHP 7 packages)
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

yum -y install \
    htop \
    iftop \
    screen \
    mc

yum -y update