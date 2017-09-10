#!/usr/bin/env bash

sudo yum -y update > /dev/null && echo "Update repos"

# Install Nginx
sudo yum -y install epel-release > /dev/null
sudo yum -y install nginx > /dev/null && echo "Install Nginx"
sudo systemctl start nginx
sudo systemctl enable nginx

# Install MySQL
sudo yum -y install mariadb-server mariadb > /dev/null && echo "Install MySQL"
sudo systemctl start mariadb
sudo systemctl enable mariadb
# Emulate mysql_secure_installation
mysql -u root <<-EOF
USE mysql;
UPDATE user SET password = PASSWORD('Vagrant123!') WHERE user = 'root';
DELETE FROM user WHERE user = 'root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM user WHERE user = '';
DELETE FROM db WHERE db = 'test' OR db = 'test_%';
FLUSH PRIVILEGES;
EOF
