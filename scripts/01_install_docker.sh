#!/usr/bin/sudo bash
sudo apt-get update
sudo apt-get install -y docker.io
docker --version
sudo systemctl enable docker
#sudo systemctl status docker
sudo systemctl start docker