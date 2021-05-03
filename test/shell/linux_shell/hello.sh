#!bin/bash
# Program:
# 测试使用source来执行shell脚本
# History:
# 2015/07/16 zhaojingrong First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
a=10
echo ${a}
b=${a}
echo "a*b" | bc
