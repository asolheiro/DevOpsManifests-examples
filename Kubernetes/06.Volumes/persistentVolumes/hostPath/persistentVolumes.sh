#!/bin/bash

echo "Creating a PersistentVolume on Kubernetes..."

echo "Getting all PersistentVolumes"
kubectl get persistentvolume -A
# 'kubectl get pv -A' works as well as above.

echo "Create a new PersistentVolume based on manifest file pv.yaml..."
kubectl apply \
    -f pv.yaml

echo "Getting the recently created PersistentVolumes"
kubectl get persistentvolume -A