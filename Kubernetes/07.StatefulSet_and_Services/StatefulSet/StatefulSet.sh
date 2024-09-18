#!/bin/bash

echo "Creating a nginx StatefulSet"

kubectl apply -f statefulset-nginx.yaml

echo "Getting all StatefulSets"
kubectl get statefulset

echo "Getting more informations about the newly created StatefulSet"
kubectl describe statefulset nginx