#!/bin/sh
set -euo pipefail

docker_push=${DOCKER_PUSH:-}
echo "DOCKER_PUSH=$docker_push"

docker build -t caronae/php:latest .

if [ "$docker_push" == true ]; then
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  docker push caronae/php
fi
