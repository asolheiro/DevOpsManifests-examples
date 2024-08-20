#! bin/bash

echo "Scaling a deployment using the command line interface"

## Creating a deployment using the given yaml file.
kubectl create deployment -f deployment.yaml

## It's a good practice to use manifests to do scales like this.
kubectl scale deployment \
    --replicas 5 \
    nginx-deployment