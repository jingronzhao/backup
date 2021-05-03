cat test.txt | cut -d " " -f 1 > temp.txt && event=$(cat temp.txt)
cat test.txt | cut -d " " -f 2 > temp.txt && time=$(cat temp.txt)
cat test.txt | cut -d " " -f 5 > temp.txt && type=$(cat temp.txt)
cat test.txt | cut -d " " -f 6 > temp.txt && size=$(cat temp.txt)
echo $time $type $size $event
