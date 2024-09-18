#!/bin/bash

echo "Creating a Headless Service to work on ClusterIP"

echo "Creating a nginx StatefulSet"
kubectl apply-f StatefulSet.yaml

echo "Creating a Headless Service"
kubectl apply -f nginx-headless.yaml

echo "Getting online services, take a look at ClusterIP to see headless service working"
kubectl get svc