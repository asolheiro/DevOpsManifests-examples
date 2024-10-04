#!/bin/bash

echo "Using local auth files to create a secret"

echo "Grab docker config.json and convert to base64 to use as a secret"
cat ~/.docker/config.json | base64 > config.base64