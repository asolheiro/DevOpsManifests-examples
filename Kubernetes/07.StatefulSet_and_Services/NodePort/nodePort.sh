#!/bin/bash

echo "Handling service of type NodePort"

echo "Creating a basic nginx deployment"
kubectl apply -f nginx-deployment.yaml

echo "Creating a service of type NordPort using k8s CLI"
kubectl expose deployment nginx-deployment \
    --type NodePort

echo "Getting service information..."
echo "Take a look at ClusterIP value. It's the default but it's also always created"
kubectl get svc

echo "Deleting service..."
kubectl delete svc nginx-deployment

echo "Creating NodePort service using manifest file..."o
kubectl apply -f nodePort.yaml

echo "Getting service informations..."
kubectl get svc

echo "Deleting NodePort service..."
kubectl delete service nginx-NodePort
