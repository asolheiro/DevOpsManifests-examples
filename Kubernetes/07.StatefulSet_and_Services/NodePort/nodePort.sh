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