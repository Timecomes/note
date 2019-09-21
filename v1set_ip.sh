#!/bin/bash
stty erase '^H'
function empty () 
{
        if [ -z $1 ]; then
        echo "Can't be empty"
        exit
        fi
}
num () {
echo "$1"|[ -n "`sed -n '/^[0-9][0-9]*$/!p'`" ] && echo "Enter the Numbers" && exit
}
set_ip () {
ipa=$(cat /mnt/etc/sysconfig/network-scripts/ifcfg'-'$n | grep IPADDR)
if [ $? -eq 0 ];then
        sed -i '/^IPADDR/d'  /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
        echo IPADDR'='$a  >> /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
else
        echo IPADDR'='$a  >> /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
fi
}
set_ga () {
ga=$(cat /mnt/etc/sysconfig/network-scripts/ifcfg'-'$n | grep GATEWAY)
if [ $? -eq 0 ];then
        sed -i '/^GATEWAY/d'  /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
        echo GATEWAY'='$g  >> /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
else
        echo GATEWAY'='$g  >> /mnt/etc/sysconfig/network-scripts/ifcfg"-"$n
fi
}
yum_in (){
rpm -q libguestfs libguestfs-tools &>/dev/null
if [ $? -ne 0 ];then
yum -y install libguestfs libguestfs-tools &>/dev/null
fi
}
yum_in
all_in () {
empty $d
num $d
empty $a
empty $h
empty $n
guestmount  -a /var/lib/libvirt/images/tedu_node$d'.img'  -i --rw /mnt/
set_ip
set_ga
echo $h > /mnt/etc/hostname
umount /mnt
echo -e "\033[1;34mSetting successful, you can restart the virtual host\033[0m"
}
read -p 'Please enter host number：' d
read -p "Please enter IP address：" a
read -p "Please enter gateway：" g
read -p "Please enter network card name：" n
read -p "Please enter a host name：" h
all_in
