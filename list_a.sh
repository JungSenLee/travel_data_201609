#!/bin/bash
FILE_NAME=$1
cat $FILE_NAME | jq -r '"\(.session.gid)"' | uniq -c | awk 'BEGIN {FS=" "} ($1 >= 5 && $2 != "null") {print $1, $2}' >> test.txt
ROW_NUM=`cat test.txt | wc -l`

for((i=1;i<=$ROW_NUM;i=i+1))
do
	GID_NUM=`cat test.txt | awk -v i=$i 'NR==i{print $2}'`
	TIME_SURF=`cat $FILE_NAME | jq -r '"\(.session.gid)\t\(.general.ts)"' | grep $GID_NUM | awk 'NR==1{origin=$2}{$2=$2-origin;print $2}' | tail -n 1`
	echo $GID_NUM $TIME_SURF >> try.txt
done
