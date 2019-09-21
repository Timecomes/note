#!/bin/bash


yum -y install gcc pcre-devel openssl-devel
useradd -s /sbin/nologin nginx
cd /opt/
tar -xf lnmp_soft.tar.gz
cd lnmp_soft/
tar -xf nginx-1.10.3
cd nginx-1.10.3
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module
make && make install
systemctl stop httpd
/usr/local/nginx/sbin/nginx

