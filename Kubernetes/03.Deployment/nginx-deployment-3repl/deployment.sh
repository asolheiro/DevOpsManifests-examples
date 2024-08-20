#!/bin/bash
echo "Create nginx deployment with 3 replicas"

## Creating a deployment using a given yamls file.
## We could also do it like:
# kubectl create deployment\
#     nginx-deployment \
#     --image nginx \
#     --replicas 3
# But it's not a good practive
kubectl create deployment \
    -f deployment.yaml

## Visualize your apps on this deployment and capture the yaml output
kubectl get deployment.apps \
    -o yaml \
    >> getDeployment.yaml

## Another way to inspect your deployment and get informations about it
kubectl describe deployment.apps \
    -o yaml \
    >> nginx-descrie.yaml

## You could get this info above using the comand bellow.
# kubectl get pods \
#     -l app=nginx-deployment

# kubectl get replicasets