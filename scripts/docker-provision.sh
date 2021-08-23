#!/bin/sh

# APT im nicht interaktiven Modus
export DEBIAN_FRONTEND=noninteractive

# Docker installieren
apt-get -y install apt-transport-https ca-certificates curl \
    gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | 
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io \
  git docker-compose

systemctl enable --now docker
adduser vagrant docker

# NGINX
# Repo klonen und Container starten
mkdir -p /home/nginx && cd /home/nginx
git clone https://github.com/nginx/nginx
cd /home/nginx

# Container starten
docker run --name hello_cgi -d nginx
