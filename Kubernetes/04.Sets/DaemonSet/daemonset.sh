#!/bin/bash

echo "Creating a DaemonSet using manifesto files..."

kubectl apply \
    -f daemonset_node-exporter.yaml