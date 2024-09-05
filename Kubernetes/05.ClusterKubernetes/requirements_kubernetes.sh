#!/bin/bash

echo "Install requirements to add a cluster kubernetes.."

sudo apt-get update

#Install kubernetes requirements
sudo apt-get install apt-transport-https curl -y

# Add kubernetes repository to package manager
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo /etc/apt/sources.list.d/k8s.list >> "deb https://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get update

# Install kubernetes agents
sudo apt-get install kubeadm kubectl kubelet -y

sudo apt-mark hold kubelet kubeadm kubectl

# Install docker requirements
sudo apt-get install gnupg lsb-release ca-certificates

# Add Docker Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add docker repository:
echo "deb \
    [arch=amd64 signed-by=/usr//share/keyrings;docker-archive-keyrings.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_releases -cs ) stable" \
    | sudo tee /etc/apt/source.list.d/docker.list > /dev/null

sudo apt-get update

# Install container runtime containerd:
sudo apt-get install containerd.io

# Generate containerd :
sudo containerd config default | sudo tee /etc/containerd/config.toml

# Set true to SystemdCgroup at containerd configs:
sed -i 's/SystemdCgroup = false/systemdCgroup = true/' /etc/containerd/config.toml

# Restart containerd to apply configs:
sudo systemctl restart containerd

# Ensure containerd is started at with boot:
sudo systemctl enable containerd

# Enable kubelet and ensure it is started with boot:
sudo systemctl --now kubelet

# Start control plane cluster kubernetes:
./control_plane_starter.sh