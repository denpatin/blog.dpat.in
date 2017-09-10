#!/usr/bin/env bash

sudo yum -y update > /dev/null && echo "Update repos"

# Essential URLs and variables
source /vagrant/variables.sh

# Check if the local kernel version is like mainline
if [ "$LOCAL_KERNEL" != "$MAINLINE_KERNEL" ];
then
  echo "Your kernel version is outdated. Updating...";
  # Activate elrepo
  sudo rpm --import $ELREPO_URL
  sudo rpm -Uvh $ELREPO
  # Check whether the necessary kernel is available
  KERNEL_REPOS=$(yum --disablerepo="*" --enablerepo="elrepo-kernel"\
 list available | grep kernel-ml.x86_64)
  if [[ $KERNEL_REPOS ]];
  then
    # Install the mainline kernel from elrepo
    sudo yum --enablerepo=elrepo-kernel -y install kernel-ml
    # Make 0th kernel load on boot
    sudo sed -i -e 's/saved/0/g' /etc/default/grub
    # Reconfigure the grub
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    # Remove all other kernels
    sudo yum -y remove "$(rpm -qa kernel | grep -v "$MAINLINE_KERNEL")"
  else
    echo >&2 "No kernel mainline repos found! Quitting...";
    exit 1;
  fi
else
  echo "Kernel is up-to-date!";
fi
