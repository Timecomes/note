#!/bin/bash
#server proxy 


yum -y install haproxy 
sed -i  '63,$d' /etc/haproxy/haproxy.cfg
echo "listen wordpress *:80
  balance roundrobin
  server web1 192.168.2.11:80 check inter 2000 rise 2 fall 3
  server web2 192.168.2.12:80 check inter 2000 rise 2 fall 3
  server web3 192.168.2.13:80 check inter 2000 rise 2 fall 3
 " >> /etc/haproxy/haproxy.cfg
systemctl start haproxy
systemctl enable haproxy
#change ip first please











