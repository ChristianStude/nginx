#!/bin/sh

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

# Docker starten und "Vagrant" als Benutzer hinzufügen
systemctl enable --now docker
adduser vagrant docker

# In das Verzeichnis Vagrant wechseln und nginx installieren
cd /vagrant
docker build -t my-nginx .

# Container my-nginx erstellen und Ports 80 und 443 zuweisen
docker run -d --restart always --name cgi-nginx -p 80:80 -p 443:443 my-nginx 
