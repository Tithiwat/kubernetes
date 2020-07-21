#!/bin/bash

#Persistent Volume
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/pods/storage/pv-volume.yaml

### Detail in https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/pods/storage/pv-volume.yaml 

# apiVersion: v1
# kind: PersistentVolume
# metadata:
#   name: task-pv-volume
#   labels:
#     type: local
# spec:
#   storageClassName: manual
#   capacity:
#     storage: 10Gi
#   accessModes:
#     - ReadWriteOnce
#   hostPath:
#     path: "/mnt/data"