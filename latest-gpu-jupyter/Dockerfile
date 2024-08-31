FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install nvidia-pyindex
RUN python3 -m pip install nvidia-cuda-runtime-cu12 nvidia-cuda-cupti-cu12 nvidia-cuda-nvcc-cu12 nvidia-nvml-dev-cu12 nvidia-cuda-nvrtc-cu12 nvidia-nvtx-cu12 nvidia-cuda-sanitizer-api-cu12 nvidia-cublas-cu12 nvidia-cufft-cu12 nvidia-curand-cu12 nvidia-cusolver-cu12 nvidia-cusparse-cu12 nvidia-npp-cu12 nvidia-nvjpeg-cu12 nvidia-nvjitlink-cu12

RUN python3 -m pip install beautifulsoup4 matplotlib nltk numpy pandas plotly psycopg2-binary regex scikit-learn scipy seaborn sqlalchemy statsmodels catboost lightgbm pillow pyspark transformers keras torch torchvision torchaudio
