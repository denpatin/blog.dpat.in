#!/usr/bin/env bash

sudo yum -y update

# Install Nginx
sudo yum -y install epel-release
sudo yum -y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
