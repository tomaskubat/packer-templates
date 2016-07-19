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
#rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
rpm -Uvh ftp://ftp.pbone.net/mirror/apt.sw.be/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

# Base Packages
yum -y install \
    htop \
    screen \
    mc

yum -y update