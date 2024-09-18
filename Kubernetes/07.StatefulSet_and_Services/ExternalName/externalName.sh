#!/bin/bash

echo "Using service of type ExternalName to handle a nginx deployment"

echo "Creating a nginx deployment to use as base to this section"
kubectl apply -f nginx-deployment.yaml

echo "Creating a ExternalName service..."
echo "Binding db.giropops.com.br to CNAME giropops.db"
kubectl create service\
    externalname giropops-db \
    --external-name db.giropops.com.br

echo "Getting service information..."
echo "Take a look at EXTERNAL-IP, see how an external reference is binded inside the cluster"
kubectl get services

echo "Deleting ExternalName service"
kubectl delete giropops-db

echo "Creating service using manifest file..."
kubectl apply -f externalName.yaml

echo "Getting service informations..."
kubectl get services

echo "Deleting ExternaName service..."
kubectl delete svc nginx-ExternalName