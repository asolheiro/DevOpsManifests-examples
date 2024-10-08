#!/bin/bash

echo "Creating a ConfigMap to deliver .conf file to Nginx"
kubectl apply -f configmap.yaml

echo "Creating a Nginx Pod running using nginx.conf"
kubectl apply -f pod.yaml