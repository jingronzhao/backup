#!/bin/bash
echo "目标地址	文件名1	文件名2	"
read addr file1 file2
if [ -e $file1 ]
then
	echo "This file:$file1 is exist"
else
	echo "This file:$file1 is not exist"
fi
echo $file2 > 2.txt
cat 2.txt | while read line
do
	echo $line
done
