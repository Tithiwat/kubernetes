#!/bin/bash
if [ -z "$1" ]; then
echo "Please input node name: $0 [node name]"
else
kubectl drain $1 --delete-local-data --force --ignore-daemonsets
kubectl delete node $1

#sudo kubeadm reset
fi
