#!/bin/bash


yum  -y  install  httpd
/usr/local/nginx/sbin/nginx -s stop
systemctl start httpd
yum -y install gcc readline-devel ncurses-devel pcre-devel python-docutils

useradd -s /sbin/nologin varnish



tar -xf varnish-5.2.1.tar.gz
cd varnish-5.2.1
 ./configure
make && make install
cp  etc/example.vcl   /usr/local/etc/default.vcl

sed -i '17s/.host = "127.0.0.1";/.host = "201.1.2.100";/' /usr/local/etc/default.vcl
sed -i '18s/8080/80/' /usr/local/etc/default.vcl

/usr/local/nginx/sbin/nginx -s stop
systemctl stop httpd
varnishd  -f /usr/local/etc/default.vcl
varnishadm

