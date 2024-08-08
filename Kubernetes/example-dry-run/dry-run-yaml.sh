#!/bin/bash
echo "Create a manifest to deploy nginx using dry-run option"

kubectl run giropops\
	--image nginx \
	--port 80 \
	--dry-run=client \
	--output yaml \
	>> nginx.yaml

