#!/bin/bash

env="classroom"

docker start $env

sleep 3
while true; do
    miniconda="$(docker ps | grep $env | awk '{ print $1 }')"
    if [ -n "$miniconda" ]; then
        echo "miniconda is running"
        break;
    else sleep 3; echo "miniconda is not running"
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
        read -p "Do you wish to S top miniconda or R estart jupyter?  " yn
        case $yn in
            [Ss]* ) docker stop $miniconda; exit;;
            [Rr]* ) pkill -f jupyter;;
            * ) echo "Please answer S to close or R to restart";;
        esac
    done

done

exit;
