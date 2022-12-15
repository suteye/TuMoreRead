#!/bin/bash
sudo yum -y update

sudo yum install -y git
sudo amazon-linux-extras install docker -y
sudo service docker start

sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

sudo gpasswd -a ec2-user docker
newgrp docker

git clone https://github.com/suteye/BakeAtDome.git
docker-compose pull
docker-compose up -d