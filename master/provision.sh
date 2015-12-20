#!/bin/bash
apt-get update
apt-get install -y mc curl vim
curl -sSL https://get.docker.com/ | sh
# docker compose
curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
mkdir -p /data/mesos/lib
mkdir -p /data/mesos/logs
mkdir -p /data/zookeeper/data
mkdir -p /data/zookeeper/logs
mkdir -p /data/registry
cd /vagrant/master
docker-compose up -d
