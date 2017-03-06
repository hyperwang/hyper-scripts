#!/bin/bash

adduser haobtc
usermod -aG sudo haobtc
if ! grep -q 'haobtc ALL=(ALL) NOPASSWD: ALL' /etc/sudoers ; then
  echo 'haobtc ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
fi

read -p "Want to disable root ssh login?[y/N]" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sed -i 's/^\(PermitRootLogin \).*/\1no/' /etc/ssh/sshd_config
  service ssh restart
fi


source /etc/lsb-release
if [[ $DISTRIB_ID != 'Ubuntu' ]]; then
   echo "Not an Ubuntu distribution!"
   exit 1
fi
rm /etc/apt/apt.conf
sed -i 's/mirror1\.mos/mirrors\.aliyun\.com/g' /etc/apt/sources.list
apt-get update
apt-get install git curl zsh


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
