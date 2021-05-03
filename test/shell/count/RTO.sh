#!/bin/bash
rtts=0
rttd=0
temp=0
rto=0
cat rtt.txt | while read rtt
do
	rtts=`echo "0.875*$rtts + 0.125*$rtt" | bc`      
	temp=`echo "$rtts - $rtt" | bc | tr -d -`     
       	rttd=`echo "0.75*$rttd + 0.25*$temp" | bc`      
	rto=`echo "4*$rttd + $rtts" | bc`     
       	echo "RTT		RTO" >> RTO.txt
	echo $rtt $rto >> RTO.txt
done
