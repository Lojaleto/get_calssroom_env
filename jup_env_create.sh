#!/bin/bash

env="classroom"

mkdir /opt/notebooks
ln -s "$(pwd)"/start_jupyter.sh ~/sj.sh

docker run -i -d -p 8888:8888 \
--hostname $env \
--mount type=bind,source=/opt/notebooks,target=/opt/notebooks \
--name $env \
--runtime=nvidia --gpus all \
nvidia/cuda:12.0.1-runtime-ubuntu22.04 /bin/bash

docker exec $env mkdir /opt/notebooks
docker exec $env apt update &> /dev/null
docker exec $env apt install -y wget
docker exec $env wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &> /dev/null
docker exec $env bash ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
docker exec $env wget "https://raw.githubusercontent.com/Lojaleto/get_calssroom_env/main/classroom.yml" &> /dev/null
docker exec $env /opt/conda/bin/conda env create -f ./classroom.yml
docker exec $env /opt/conda/bin/conda activate classroom
docker exec $env /opt/conda/bin/conda install jupyter -y --quiet

docker stop $env

exit;
