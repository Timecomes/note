#!/bin/bash
#makeNFSserver first make 共享文件
yum install nfs-utils
mkdir /web_share
echo "/web_share  192.168.2.0/24(rw,no_root_squash)" >> /etc/exports
systemctl restart rpcbind
systemctl eanble rpcbind
systemctl restart nfs
systemctl enable nfs



#secend where to mount 
#给我你的ip位置
# for i in 192.168.4.254 192.168.2.254 172.0.0.0
# ssh $i "yum -y install nfs-utils"
# ssh $i "echo \"192.168.2.31:/web_share/html /usr/local/nginx/html/ nfs defaults 0 0\" >> /etc/fstab"
# ssh $i "mount -a"







