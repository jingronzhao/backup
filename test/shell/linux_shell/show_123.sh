#!/bin/bash
# Program:
# Use function to repeat information.
# History:
# 2015/07/17 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
function printit (){
	echo "Your choice is ${1}" # 这个 $1 必须要参考下面指令的下达
}
echo "This program will print your selection !"
case ${1} in
	"one")
	**printit 1** # 请注意， printit 指令后面还有接参数！
	;;
	"two")
	**printit 2**
	;;
	"three")
	**printit 3**
	;;
	*)	
	echo "Usage ${1} {one|two|three}"
	;;
esac
