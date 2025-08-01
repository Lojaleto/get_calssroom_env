# get_classroom_env
run latest-gpu-jupyter and classroom environment install<br />
prerequisites nvidia driver and cuda
XXX - version driver
you eed to find a suitable driver for your graphics card on the website https://www.nvidia.com/en-us/drivers/

```
apt install nvidia-driver-XXX
apt install nvidia-utils-XXX
apt install nvidia-cuda-toolkit
```

compatibility<br />
https://developer.nvidia.com/cuda-gpus<br />
https://developer.nvidia.com/cuda-legacy-gpus
<br /><br />
based on tensorflow container

script mount `/tf/` as `/tf/` in container.<br />
this is the jupyter root folder.<br />

it is assumed that you have ubuntu/debian (or wsl2)<br />

```
git clone git@github.com:Lojaleto/get_calssroom_env.git
cd get_calssroom_env
sudo ./env_create.sh
docker compose up --build
```

you can change libraries in ```latest-gpu-jupyter/Dockerfile```
