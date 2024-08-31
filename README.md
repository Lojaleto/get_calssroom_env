# get_classroom_env
run latest-gpu-jupyter and classroom environment install<br />
based on tensorflow container

script mount `/tf/` as `/tf/` in container.<br />
this is the jupyter root folder.<br />

it is assumed that you have ubuntu/debian (or wsl2)<br />
```
git clone git@github.com:Lojaleto/get_calssroom_env.git
cd get_calssroom_env
sudo ./env_create.sh
docker compose up
```
