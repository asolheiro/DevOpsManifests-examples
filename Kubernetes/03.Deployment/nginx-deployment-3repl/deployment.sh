#!/bin/bash
echo "Create nginx deployment with 3 replicas"

kubectl apply \
    -f deployment.yaml

kubectl get deployment.apps \
    -o yaml \
    >> getDeployment.yaml

kubectl describe deployment.apps \
    -o yaml \
    >> nginx-descrie.yaml
# kubectl get pods \
#     -l app=nginx-deployment

# kubectl get replicasets