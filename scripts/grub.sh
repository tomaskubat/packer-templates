#!/usr/bin/env bash

set -e
set -o pipefail
set -x

sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sed -i 's/quiet//g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg