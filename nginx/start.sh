#!/usr/bin/env bash

# Switch to the directory containing this script:
cd "$(dirname "$0")"

# Create temporary directory and enviroment variable:
mkdir -p "tmp"
mkdir -p "log"

# Substitute the variable in the config template:
envsubst '${PWD}' < nginx.template.conf > "${PWD}/tmp/nginx.conf"

# Go!
/usr/bin/env nginx -c "${PWD}/tmp/nginx.conf"
