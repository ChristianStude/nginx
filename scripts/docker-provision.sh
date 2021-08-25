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

cd /vagrant
docker build -t my-nginx .
docker run -d --restart always --name cgi-nginx -p 80:80 -p 443:443 my-nginx 

#sudo mkdir -p /etc/nginx/ssl
#cd /etc/nginx/ssl



#openssl genrsa -out cgi_challenge.key 2048
#openssl req -new -key cgi_challenge.key -out cgi_challenge.csr
#DE \
#Thuringia \
#Weimar \
#MyOrganisation \
#MyOrg \
#my.org \
#my@org.com \
#\
#\

#openssl x509 -req -days 730 -in cgi_challenge.csr -signkey cgi_challenge.key -out cgi_challenge.crt

#openssl dhparam -out dhparam.pem 2048


