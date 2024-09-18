#!/bin/bash

echo "Using LoadBalancer service to handle a nginx deployment"
echo "Warning: this steps only works with a proper service associated, i.e.: AWS - EKS, MetalLB"

echo "Creating a nginx deployment to be the base"
kubectl apply -f nginx-deployment.yaml

echo "Creating a LoadBalancer to handle requests to nginx-deployment"
kubectl expose deployment nginx-deployment --type LoadBalancer 

echo "Getting services informations..."
kubectl get svc

echo "Deleting service..."
kubectl delete svc nginx-deployment