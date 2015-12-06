#!/bin/bash
apt-get update
apt-get install -y mc curl vim
curl -sSL https://get.docker.com/ | sh
# docker compose
curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
mkdir /data
mkdir /data/mesos
mkdir /data/zookeeper
mkdir /data/mesos/lib
mkdir /data/mesos/logs
mkdir /data/zookeeper/data
mkdir /data/zookeeper/logs
cd /vagrant/master
docker-compose up -d
