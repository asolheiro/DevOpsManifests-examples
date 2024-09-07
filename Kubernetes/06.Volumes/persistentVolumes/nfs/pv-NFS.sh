#!/bin/bash

echo "Creating a nfs server..."

echo "Creating a nfs folder in /mnt and given it to current user..."
sudo mkdir /mnt/nfs && sudo chown $USER /mnt/nfs

echo "Installing nfs packages..."
sudo apt-get update \
    && sudo apt-get install nfs-kernel-server nfs-common \
    -y

echo "Adding folder to /etc/exports..."
echo "/mnt/nfs *(rw,sync,no_root_squash,no_subtree_check)" | sudo tee -a /etc/exports

echo "Informing NFS that a new folder has been shared with network..."
sudo exportfs -ar

echo "Get all shared volumes with network..."
showmount -e