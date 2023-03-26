#!/bin/bash

env="classroom"

mkdir /opt/notebooks
ln -s "$(pwd)"/start_jupyter.sh ~/sj.sh

docker run -i -d -p 8888:8888 \
--hostname $env \
--mount type=bind,source=/opt/notebooks,target=/opt/notebooks \
--name $env \
--runtime=nvidia --gpus all \
tensorflow/tensorflow:nightly-gpu-jupyter /bin/bash

docker exec classroom mkdir /opt/notebooks
docker exec classroom apt update &> /dev/null
docker exec classroom apt upgrade -y
docker exec classroom apt install -y wget g++ pip
#docker exec classroom python3 -m pip install --upgrade pip setuptools wheel nbformat ipykernel ipython ipython_genutils jupyter jupyter_client jupyter_console jupyter_core jupyterlab jupyterlab_server requests nest-asyncio
#docker exec classroom python3 -m pip install -U $(pip freeze | cut -d '=' -f 1)

docker exec classroom python3 -m pip install nvidia-pyindex
docker exec classroom python3 -m pip install nvidia-cuda-runtime-cu12 nvidia-cuda-cupti-cu12 nvidia-cuda-nvcc-cu12 nvidia-nvml-dev-cu12 nvidia-cuda-nvrtc-cu12 nvidia-nvtx-cu12 nvidia-cuda-sanitizer-api-cu12 nvidia-cublas-cu12 nvidia-cufft-cu12 nvidia-curand-cu12 nvidia-cusolver-cu12 nvidia-cusparse-cu12 nvidia-npp-cu12 nvidia-nvjpeg-cu12 nvidia-nvjitlink-cu12

docker exec classroom python3 -m pip install beautifulsoup4 matplotlib nltk numpy pandas plotly psycopg2-binary regex scikit-learn scipy seaborn sqlalchemy statsmodels catboost lightgbm pillow pyspark transformers keras torch torchvision torchaudio

docker stop classroom

exit;
