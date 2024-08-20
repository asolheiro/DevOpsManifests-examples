#!/bin/bash
echo "Updating nginx deployment using yaml files"

kubectl apply \
    -f deployment.yaml

kubectl create namespace giropops

kubectl create namespace giropops \
    --dry-run=client \
    -o yaml \
    >> namespace.yaml

kubectl apply \
    -f deploymentUpdated.yaml   

kubectl get deployment.apps \
    -n giropops
    -o yaml \
    >> getDeployment.yaml

kubectl describe deployment.apps \
    -n giropops
    -o yaml \
    >> nginx-describe.yaml

# kubectl get pods \
#     -l app=nginx-deployment