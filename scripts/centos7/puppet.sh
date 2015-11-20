#!/usr/bin/env bash

set -e
set -o pipefail
set -x

REPO_URL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install Puppet labs repository
rpm -ivh ${REPO_URL} >/dev/null

# Install Puppet agent package...
yum install -y puppet-agent

# Allow call Puppet by sudo
echo "Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin" > /etc/sudoers.d/trust-puppetlabs-bin && chmod 440 /etc/sudoers.d/trust-puppetlabs-bin
