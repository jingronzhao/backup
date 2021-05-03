cat out.tr | grep -w "^r" > temp.txt
cat temp.txt | grep -w "1 0" > node1_0.txt
cat temp.txt | grep -w "0 1" >> node1_0.txt
rm temp.txt
