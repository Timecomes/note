(1). 使用 while 循环,统计 1+2+3+4...+100。提示:可以用一个独立的变量 sum 存放求和的值。

#!/bin/bash
a=0
b=0
while : 
do
if [ $b -eq 100 ];then
    echo $a
    exit
else
  let b++
 a=$[a+b]
fi
done

----------------------------------------------------------------------------------

(2). 编写脚本,使用 for 对 2000 以内的整数循环,判断哪些数字是177的倍数并显示。
提示:可以使用取余运算，余数为0则是倍数

#!/bin/bash
for i in `seq 2000`
do
a=$[i%177]
if  [ $a -eq 0  ] ;then
echo $i
fi
done

----------------------------------------------------------------------------------

(3). 编写脚本,通过 3 个 read 命令读取用户输入的三个任意数字,脚本对输入的三个数字求和输出。
#!/bin/bash
read -p "求和第一个数" a
read -p "第二个数" b
read -p "第三个数" c
d=$[a+b+c]
echo "$a+$b+$c = $d"

#!/bin/bash
#做个while
read -p "求和第一个数" a
read -p "第二个数" b
read -p "第三个数" c
d=$[a+b+c] 
if [ $? -ne 0 ];then
  echo "请输入数字! "
  exit
fi
echo "$a+$b+$c = $d"

while :
do
read -p "求和即将开始是否继续(yes/no): " i
case $i in
no|NO|N|n)
    exit ;;
*)
read -p "求和第一个数:" qcqaqAqhhhhhHHHHH
read -p "第二个数:" wqcqaqAqhhhhHHHH
read -p "第三个数:" eqcqaqAqhhhhhHHHHHH
r=0
$r=$[qcqaqAqhhhhhHHHHH+wqcqaqAqhhhhHHHH+eqcqaqAqhhhhhHHHHHH]  &> /dev/null
if [ $? -ne 0 ];then
  echo "请输入数字! "
  continue
fi
echo "$qcqaqAqhhhhhHHHHH+$wqcqaqAqhhhhHHHH+$eqcqaqAqhhhhhHHHHHH = $r"
esac

done

----------------------------------------------------------------------------------

(4). 判断当前系统启动的进程数量,如果进程数量超过 100 个,则发送邮件给 root 报警。
(ps aux命令可以查看进程,wc -l可以统计数量)

#!/bin/bash
while :
do
a=`ps aux | wc -l`
if [ $a -gt 100 ];then
  echo "警告 运行进程过多!" | mail -s "警告" root
  sleep 1200
fi
sleep 600
done

----------------------------------------------------------------------------------

(5). 编写脚本,测试当前用户对/etc/passwd 文件是否具有读、写、执行的权限,脚本执行结果类似下面的效果。
当前用户对/etc/passwd 有读权限
当前用户对/etc/passwd 有写权限
当前用户对/etc/passwd 无执行权限

#!/bin/bash
if [ $UID -eq 0 ];then
  echo "你是超级管理员"
else
  cat /etc/passwd     &> /dev/null
   if [ $? -eq 0 ];then
      echo "当前用户对/etc/passwd 有读取权限"
   else
      echo "当前用户对/etc/passwd 无读取权限"
      fi
  echo " " >> /etc/passwd   &> /dev/null
   if [ $? -eq 0 ];then
      echo "当前用户对/etc/passwd 有写入权限"
   else
      echo "当前用户对/etc/passwd 无写入权限"
   fi
  bash /etc/passwd   &> /dev/null
   if [ $? -eq 0 ];then
      echo "当前用户对/etc/passwd 有执行权限"
   else
      echo "当前用户对/etc/passwd 无执行权限"
   fi

fi

----------------------------------------------------------------------------------

(6).有一个文件user.txt 里面存放了不同的账户名称,具体内容如下：
zhangsan
lisi
wangwu
请编写脚本，能够根据文件中的账户名分别创建账户。

#!/bin/bash
a=`cat user.txt`
for i in $a
do
useradd $i
echo "123" | passwd --stdin $i
echo $i
done

----------------------------------------------------------------------------------

(选做题). 使用循环打印 5*5 的星星,脚本输出如下形状:(5 行,5 列),备注:echo -n 可以不换行输出。
* * * * *
* * * * *
* * * * *
* * * * *

