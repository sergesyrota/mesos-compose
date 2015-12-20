#!/bin/bash
apt-get update
apt-get install -y mc curl vim
curl -sSL https://get.docker.com/ | sh
# add registry
cat <<EOF >> /etc/default/docker
DOCKER_OPTS="--insecure-registry=192.168.33.10:5000"
EOF
service docker restart
# docker compose
curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /vagrant/mesos-slave
docker-compose up -d
