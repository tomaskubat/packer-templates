#!/usr/bin/env bash

set -e
set -o pipefail
set -x

rm -fv /var/lib/dhclient/dhclient-*.leases
rm -fv /etc/ssh/ssh_host_*