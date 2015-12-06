#!/bin/bash
apt-get update
apt-get install -y mc curl vim
curl -sSL https://get.docker.com/ | sh
# docker compose
curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /vagrant
docker-compose up -d

#Mesos slave
# Setup
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
#DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
#CODENAME=$(lsb_release -cs)

# Add the repository
#echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | \
#	sudo tee /etc/apt/sources.list.d/mesosphere.list
#apt-get -y update
#apt-get install mesos=0.25.0-0.2.70.ubuntu1204
#service zookeeper stop
#service mesos-master stop
#echo "zk://192.168.33.10:2181/mesos" > /etc/mesos/zk
#echo "192.168.33.11" > /etc/mesos-slave/hostname