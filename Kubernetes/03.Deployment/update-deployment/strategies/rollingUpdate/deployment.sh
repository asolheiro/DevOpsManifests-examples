#!/bin/bash
echo "Updating nginx deployment using RollingUpdate strategy"

kubectl apply \
    -f deployment.yaml

kubectl create namespace giropops

kubectl create namespace giropops \
    --dry-run=client \
    -o yaml \
    >> namespace.yaml

kubectl apply \
    -f deploymentUpdated.yaml   

kubectl rollout status \
    -n giropops \
    nginx deployment
