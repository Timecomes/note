#!/bin/bash




yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-fpm php-mysql php-pecl-memcache
#下载 数据库mariadb 和php动态网页编辑器 同时下载 php对memcache 的支持模块 以便使用数据
库


systemctl stop httpd
systemctl start mariadb
systemctl start php-fpm
#关闭可能存在冲突的 80端口 httpd服务 开启数据库和php服务


sed -i '65,71s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '/SCRIPT_FILENAME/d' /usr/local/nginx/conf/nginx.conf
sed -i 's/fastcgi_params/fastcgi.conf/' /usr/local/nginx/conf/nginx.conf
sed -i '224s/files/memcache/' /etc/php-fpm.d/www.conf
sed -i '225s/\/var\/lib\/php\/session/"tcp:\/\/201.1.2.5:11211"/' /etc/php-fpm.d/www.conf
#修改配置文件 1 打开动态网页分流 当用户访问网站的 动态页面时 使用php翻译
# 2 同上配置文件  不需要此行 删除
# 3 修改本行原始数据 改为.conf
# 4 此处为修改连接数据库的文件 由于是由 php软件转发 所以在/etc/php-fpm.d/www.conf下
#修改 储存地点 由本地 改为 memcache


/usr/local/nginx/sbin/nginx -s stop
/usr/local/nginx/sbin/nginx -s reload
systemctl restart mariadb
systemctl restart php-rpm
/usr/local/nginx/sbin/nginx


