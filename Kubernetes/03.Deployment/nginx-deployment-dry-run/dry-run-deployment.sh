#! bin/bash
echo "Create yaml deployment using kubectl dry-run option"

kubectl create deployment \
    --image nginx \
    --replicas 3 \
    nginx-deployment \
    --dry-run=client \
    -o yaml \
    >> deployment.yaml

kubectl apply \
    -f deployment.yaml \
 