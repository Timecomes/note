#!/bin/bash
#


yum -y  install bind bind-chroot

sed -i '13s/^.*.*$/listen-on port 53 { any; };/' /etc/named.conf

19
allow-query     { any; };
sed -i '19s/^.*.*$/   allow-query { any; };/' /etc/named.conf
57
58
加#
sed -i '57s/^./#/' /etc/named.conf
sed -i '58s/^./#/' /etc/named.conf

cp -p /var/named/named.localhost /var/named/lab.com.zone

echo "$TTL 1D
@       IN SOA  @ rname.invalid. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum
@        NS     dns.lab.com.
dns     A       192.168.4.5
www     A       192.168.4.5" > /var/named/lab.zone



systemctl start named
systemctl enable named

