#!/bin/bash
yum -y install libreswan


echo "conn IDC-PSK-NAT
    rightsubnet=vhost:%priv
    also=IDC-PSK-noNAT

conn IDC-PSK-noNAT
    authby=secret
        ike=3des-sha1;modp1024
        phase2alg=aes256-sha1;modp2048
    pfs=no
    auto=add
    keyingtries=3
    rekey=no
    ikelifetime=8h
    keylife=3h
    type=transport
    left=150.109.101.182   
    leftprotoport=17/1701
    right=%any
    rightprotoport=17/%any"  > /etc/ipsec.d/myipsec.conf 


echo "150.109.101.182     %any:    PSK     randpass" >  /etc/ipsec.d/myipsec.secrets


yum -y install xl2tpd-1.3.8-2.el7.x86_64.rpm

sed -i '32s/192.168.2.128-192.168.2.254/192.168.3.128-192.168.3.254/' /etc/xl2tpd/xl2tpd.conf
sed -i '33s/201.1.2.10/150.109.101.182 /' /etc/xl2tpd/xl2tpd.conf
sed -i '16s/\.*/#/' /etc/ppp/options.xl2tpd
sed -i '10s/\.*/#/' /etc/ppp/options.xl2tpd
sed -i '21s/# //' /etc/ppp/options.xl2tpd
echo "tom * 123456 *" /etc/ppp/chap-secrets



systemctl start xl2tpd
echo "1" > /proc/sys/net/ipv4/ip_forward
firewall-cmd --set-default-zone=trusted
iptables -t nat -A POSTROUTING -s 192.168.3.0/24  -j SNAT --to-source 150.109.101.182 


















