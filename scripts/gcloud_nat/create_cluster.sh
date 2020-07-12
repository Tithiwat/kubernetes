#!/bin/bash

# Instruction from here
# https://cloud.google.com/solutions/creating-kubernetes-engine-private-clusters-with-net-proxies

export INSTANCE_NAME=ubuntu
export REGION=us-central1
export ZONE=us-central1-c
# export REGION=asia-east1
# export ZONE=asia-east1-b

gcloud config set compute/region $REGION
gcloud config set compute/zone $ZONE
export CLIENT_IP=`gcloud compute instances describe $INSTANCE_NAME --format="value(networkInterfaces[0].networkIP)"`

export CLUSTER_NAME=rook
export NETWORK_NAME=k8s-proxy
export CLUSTER_SUBNETWORK=subnet-cluster
export MASTER_CIDR=172.16.0.64/28
# --create-subnetwork name=$CLUSTER_SUBNETWORK \

gcloud container clusters create $CLUSTER_NAME  \
    --master-ipv4-cidr=$MASTER_CIDR \
    --network $NETWORK_NAME \
    --subnetwork=$CLUSTER_SUBNETWORK \
    --enable-ip-alias \
    --enable-private-nodes \
    --enable-private-endpoint \
    --master-authorized-networks $CLIENT_IP/32 \
    --enable-master-authorized-networks \
    --num-nodes 3

# bash -i