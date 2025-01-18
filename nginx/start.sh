#!/usr/bin/env bash

# Switch to the directory containing this script:
cd "$(dirname "$0")"

# Create temporary directory and enviroment variable:
export TEMP="$(pwd)/temp"
mkdir -p "$TEMP"
echo "Using temporary directory at '$TEMP'"

# Substitute the variable in the config template:
envsubst < nginx.template.conf > "$TEMP/nginx.conf"

# Go!
/usr/bin/env nginx -T -c "$TEMP/nginx.conf"
