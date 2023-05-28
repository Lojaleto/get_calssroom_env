#!/bin/bash

env="classroom"

docker start $env

sleep 3
while true; do
    container="$(docker ps | grep $env | awk '{ print $1 }')"
    if [ -n "$container" ]; then
        echo "container is running"
        break;
    else sleep 3; echo "container is not running"
    fi
done

while true; do

    nohup docker exec $env jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root > ./jupyter.log &

    sleep 5
    while true; do
        lsize="$(wc -c ./jupyter.log | awk '{ print $1 }')"
        if [[ $lsize > 1000 ]]; then
            cat ./jupyter.log
            echo 'other ip:'
            ip route get 8.8.8.8 |awk '{ print $7 }'
            echo '' > ./jupyter.log
            break;
        else sleep 3; echo "jupyter is not running"
        fi
    done

    while true; do
        echo $jpid
        read -p "Do you wish to S top or R estart jupyter?  " yn
        case $yn in
            [Ss]* ) docker stop $container; exit;;
            [Rr]* ) docker exec $env pkill -f jupyter; break;;
            * ) echo "Please answer S to close or R to restart";;
        esac
    done

done

exit;
