#!/bin/bash

#mon
 yum -y install ceph-deploy
mkdir ceph-cluster
cd ceph-cluster/
ceph-deploy new node1 node2 node3
for i in node1 node2 node3
do
    ssh  $i "yum -y install ceph-mon ceph-osd ceph-mds ceph-radosgw"
done 

ceph-deploy mon create-initial




#osd
for i in node1 node2 node3
do
     ssh $i "parted /dev/vdb mklabel gpt"
     ssh $i "parted /dev/vdb mkpart primary 1 50%"
     ssh $i "parted /dev/vdb mkpart primary 50% 100%"
 done

 for i in node1 node2 node3; do ssh $i "chown ceph.ceph /dev/vdb1"; ssh $i "chown ceph.ceph /dev/vdb2"; done

for i in node1 node2 node3
do
 ssh $i " echo 'ENV{DEVNAME}==\"/dev/vdb1\",OWNER=\"ceph\",GROUP=\"ceph\"
ENV{DEVNAME}==\"/dev/vdb2\",OWNER=\"ceph\",GROUP=\"ceph\"' > /etc/udev/rules.d/70-vdb.rules "
done

 for i in node1 node2 node3
 do
 scp /etc/udev/rules.d/70-vdb.rules $i:/etc/udev/rules.d/
 done


ceph-deploy disk  zap  node1:vdc node1:vdd node2:vdc node2:vdd node3:vdc node3:vdd
#清空磁盘数据



for i in node1 node2 node3
 do
 ceph-deploy osd create $i:vdc:/dev/vdb1 $i:vdd:/dev/vdb2
 done
ceph -s
sleep 5
ceph -s






