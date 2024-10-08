#!/bin/bash

echo "Creating certificate..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt

echo "Creating a TLS secret with nginx.crt and nginx.key"
kubectl create secret tls nginx-secret --key=nginx.key --cert=nginx.crt -o yaml > nginx-secret.yaml
kubectl apply -f nginx-secret.yaml

echo "Creating a ConfigMap to add nginx.conf with proper instructions"
kubectl apply -f nginx-conf.yaml

echo "Creating a Pod to consume the previously objects"
kubectl apply -f nginx-https-pod.yaml

echo "Create a service to expose that pod in NodePort 30443"
kubectl apply -f nginx-service.yaml

