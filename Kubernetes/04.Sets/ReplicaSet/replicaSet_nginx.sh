#!/bin/bash

echo "Running a Nginx ReplicaSet manually writen..."

kubectl aply \
    -f replicaSet_nginx.yaml

# Be careful when using it. ReplicaSet only update pods on delete; differently from deployment,that updates intantly on apply.
# For a better practice, always use a deployment.