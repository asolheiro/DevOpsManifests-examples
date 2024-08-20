#! bin/bash

echo "Applying rollback to deployment using rollback commands"

kubectl create deployment \
    -f deployment.yaml

kubectl apply deployment \
    -f deploymentUpdated.yaml

kubectl rollout status \
    nginx-deployment

kubectl rollout undo deployment \
    nginx-deployment 

kubectl rollout status \
    nginx-deployment