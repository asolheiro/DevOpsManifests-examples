#!/bin/bash

echo "Creating certificate..."
openssl req-x509 -nodes -days 365 rsa:2048 -keyout private.key -out certificate.cert