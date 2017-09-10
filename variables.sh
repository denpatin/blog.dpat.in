#!/usr/bin/env bash

export KERNEL_URL=https://www.kernel.org
export ELREPO_URL=https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
export ELREPO=http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
export MAINLINE_KERNEL=$(curl -s $KERNEL_URL |\
 grep -A1 'mainline:' |\
 grep -oP '(?<=strong>).*(?=</strong.*)')
export LOCAL_KERNEL=$(uname -r | awk -F. '{OFS="."} {print $1,$2}')
