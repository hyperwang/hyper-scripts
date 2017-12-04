#!/bin/bash

curl -sSL https://get.daocloud.io/docker | sh
wget https://get.daocloud.io/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m`  -O /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
