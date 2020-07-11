#!/usr/bin/sudo bash
# next step kubernetes
sudo apt-get install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

# Add repository
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get update
sudo apt-get -y install kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl
kubeadm version

#sudo hostnamectl set-hostname master-node
#sudo hostnamectl set-hostname worker01