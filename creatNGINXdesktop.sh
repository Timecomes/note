#!/bin/bash


yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-fpm php-mysql

sed -i '65,71s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '/SCRIPT_FILENAME/d' /usr/local/nginx/conf/nginx.conf
sed -i 's/fastcgi_params/fastcgi.conf/' /usr/local/nginx/conf/nginx.conf


systemctl stop httpd
systemctl start mariadb
systemctl start php-rpm
/usr/local/nginx/sbin/nginx


