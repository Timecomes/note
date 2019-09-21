echo "[1]
name=2
baseurl="ftp://176.209.101.7/centos-1804/"
enabled=1
gpgcheck=0" > /etc/yum.repo.d/local.repo
yum clean all
yum repolist

