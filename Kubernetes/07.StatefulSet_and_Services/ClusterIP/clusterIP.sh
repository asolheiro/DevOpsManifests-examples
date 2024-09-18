#!/bin/bash

echo "Handling services of type ClusterIP"

echo "Creating a nginx deployment"
kubectl apply -f nginx-deployment.yaml

echo "Exposing deployment using CLI"
kubectl expoose deployment nginx-deployment

echo "Getting services..."
echo "Take a look how kubernetes takes ClusterIP as default service if we don't pass any as arguments"
kubectl get services

echo "Deleting service..."
kubectl delete svc nginx-deployment

echo "Creating ClusterIP service usinf manifest file..."
kubectl apply -f clusterIP.yaml

echo "Getting service informations..."
kubectl get svc 

echo "Deleting CLusterIP service..."
kubectl delete svc nginx-service