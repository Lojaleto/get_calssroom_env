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
docker exec $env apt install -y wget g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libfreeimage-dev libglfw3-dev libglfw3-dev pip
docker exec $env wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &> /dev/null
docker exec $env bash ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
docker exec $env /opt/conda/bin/conda install cuda -c nvidia
docker exec $env python3 -m pip install --upgrade setuptools pip wheel
docker exec $env python3 -m pip install nvidia-pyindex
docker exec $env python3 -m pip install nvidia-cuda-runtime-cu12 nvidia-cuda-cupti-cu12 nvidia-cuda-nvcc-cu12 nvidia-nvml-dev-cu12 nvidia-cuda-nvrtc-cu12 nvidia-nvtx-cu12 nvidia-cuda-sanitizer-api-cu12 nvidia-cublas-cu12 nvidia-cufft-cu12 nvidia-curand-cu12 nvidia-cusolver-cu12 nvidia-cusparse-cu12 nvidia-npp-cu12 nvidia-nvjpeg-cu12 nvidia-nvjitlink-cu12
docker exec $env wget "https://raw.githubusercontent.com/Lojaleto/get_calssroom_env/main/classroom.yml" &> /dev/null
docker exec $env /opt/conda/bin/conda env create -f ./classroom.yml
docker exec $env /opt/conda/bin/conda activate classroom
docker exec $env /opt/conda/bin/conda install jupyter -y --quiet

docker stop $env

exit;
