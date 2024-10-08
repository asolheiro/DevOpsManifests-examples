#!/bin/bash

echo "Creating a Nginx Pod that consumes a tls secret to define certificates"
kubectl apply -f tls-secret.yaml

echo "Creating a Pod to consume that secret"
kubectl apply -f pod-secret.yaml
