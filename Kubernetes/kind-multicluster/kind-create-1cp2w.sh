#!/bin/bash
echo "Create multi-node cluster using kind and custom configs"

kind create cluster \
	--config kind.yaml \
	--name giropops


