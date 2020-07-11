#!/bin/bash

export INSTANCE_NAME=ubuntu
export REGION=us-central1
export ZONE=us-central1-c

gcloud config set compute/region $REGION
gcloud config set compute/zone $ZONE
export CLIENT_IP=`gcloud compute instances describe $INSTANCE_NAME --format="value(networkInterfaces[0].networkIP)"`

export CLUSTER_NAME=private-rook
export CLUSTER_SUBNETWORK=subnet-cluster

# gcloud container clusters create private-cluster \
#     --create-subnetwork name=private-cluster \
#     --enable-ip-alias \
#     --enable-private-nodes \
#     --master-ipv4-cidr 172.16.0.0/28 \
#     --enable-master-authorized-networks \
#     --master-authorized-networks $CLIENT_IP/32
#     --no-enable-basic-auth \
#     --no-issue-client-certificate


gcloud container clusters create $CLUSTER_NAME \
    --network=k8s-proxy \
    --subnetwork=$CLUSTER_SUBNETWORK \
    --enable-ip-alias \
    --enable-private-nodes \
    --master-ipv4-cidr 172.16.0.0/28 \
    --enable-master-authorized-networks \
    --master-authorized-networks $CLIENT_IP/32 \
    --no-enable-basic-auth \
    --no-issue-client-certificate

# bash -i