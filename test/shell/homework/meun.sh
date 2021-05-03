#!/bin/bash
echo "You should input the KEY_WORD to show the information"
case $1 in 
	"save")
		echo "save"
		;;
	*)
		echo "You should input the incurrect word"
		;;
esac
