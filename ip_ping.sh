#!/bin/bash

echo "=== ping起來 ==="

pingfile=./ip.txt


while true
do
    echo $(date) >> ./info.txt
    declare -i START_TIME
    START_TIME=$SECONDS

    for i in `cat $pingfile`
    do
        result=`ping -w 3 -c 3 $i `
        echo $result >> ./info.txt
    done
    echo -e "\n" >> ./info.txt

    ELAPSED_TIME=$(($SECONDS - $START_TIME))
    declare -i ELAPSED_TIME
    echo $ELAPSED_TIME

    if [ $ELAPSED_TIME -gt 20 ]; then
        echo "Congestion Control Mode"
        sleep 10m
    else
        echo "Normal Mode"
        sleep 5m
    fi

done

exit