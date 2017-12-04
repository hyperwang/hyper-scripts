#!/bin/bash

apt-get update
apt-get install git curl zsh

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
