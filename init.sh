#!/bin/bash

adduser haobtc
usermod -aG sudo haobtc
if ! grep -q 'haobtc ALL=(ALL) NOPASSWD: ALL' /etc/sudoers ; then
  echo 'haobtc ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
fi

read -p "Want to disable root ssh login?[y/N]"
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
