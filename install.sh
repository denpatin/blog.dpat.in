#!/usr/bin/env bash

sudo yum -y update > /dev/null && echo "Update repos"
sudo yum -y install curl unzip > /dev/null

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

# Install PHP
sudo yum -y install php php-mysql php-fpm > /dev/null && echo "Install PHP"
sudo sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php.ini
sudo sed -i -e 's/listen =.*/listen = \/var\/run\/php-fpm\/php-fpm.sock/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/;listen.owner = nobody/listen.owner = nobody/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/;listen.group = nobody/listen.group = nobody/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sudo sed -i -e 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
