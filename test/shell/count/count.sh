#/bin/bash
cat date.txt | grep -n 'Internet Protocol' > 1.txt 
wc -l 1.txt  
rm 1.txt
acho=123
