#!/bin/bash

echo "Configuring weave net on control plane:"

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# Don't forget to release network plugin ports on your provider. Usually, weavenet use 6783/TCP and 6783-6784/UDP