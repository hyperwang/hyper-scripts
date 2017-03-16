#!/bin/bash

curl -sSL https://get.daocloud.io/docker | sh
wget https://get.daocloud.io/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m`  -O /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker login --username=gonbo@aliyun.com registry.cn-hangzhou.aliyuncs.com

su - haobtc 
cd ~
echo "set ts=4
set expandtab
" > /home/haobtc/.vimrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "alias 'hn=hostname'" >> /home/haobtc/.zshrc
