#!/bin/bash
ls | grep .c > a.txt
read -p "目标地址：" way
cat a.txt | while read line
do
	filename=`basename $line`;
	echo $filename
	cp $line $way
done
echo "输入的地址为：$way"
 
