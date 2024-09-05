#!/bin/bash

echo "Starting control plane..."

echo "Grep ip to allow nodes exchanges..."
ip_inet=$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1)

echo "Initializing kubeadm with 10.10.0.0/16 as pod network and IP Advertise Address from eth0 inet"
sudo OUTPUT=$(kubeadm init \
    --pod-network-cidr=10.10.0.0/16 \
    --api-server-advertise-address="$ip_inet")

echo "Preparing cluster to be used as a regular user and enable kubectl functions..."
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Treating kubeadm's output to print 'kubeadm join'
JOIN_CMD=$(echo "$OUTPUT" | awk '/kubeadm join/ {print $0}')

echo "Grab the following command to join workers to this control plane:\n
    $JOIN_CMD"

