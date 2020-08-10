#!/bin/bash
# https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/

kubectl apply -f https://k8s.io/examples/pods/storage/pv-volume.yaml

kubectl apply -f https://k8s.io/examples/pods/storage/pv-claim.yaml

kubectl apply -f https://k8s.io/examples/pods/storage/pv-pod.yaml

kubectl get pod task-pv-pod

kubectl exec -it task-pv-pod -- /bin/bash


# kubectl delete pod task-pv-pod
# kubectl delete pvc task-pv-claim
# kubectl delete pv task-pv-volume