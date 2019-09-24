#!/bin/bash


ssh-keygen   -f /root/.ssh/id_rsa    -N ''
#当系统存在 秘钥 私钥时 有bug 会出现交互指令 询问是否覆盖之前文件
for i in 10  11  12  13
do
  ssh-copy-id  192.168.4.$i
done





