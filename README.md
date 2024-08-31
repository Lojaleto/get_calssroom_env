# get_classroom_env
run latest-gpu-jupyter and classroom environment install<br />
based on tensorflow container

script mount `/tf/` as `/tf/` in container.<br />
this is the jupyter root folder.<br />

it is assumed that you have linux (or wsl)<br />

git clone git@github.com:Lojaleto/get_calssroom_env.git<br />

run `env_create.sh` to install docker and nvidia container toolkit<br />

docker compose up