#!/bin/sh

docker build -t caronae/php:latest .

if [ "$DOCKER_PUSH" = 'true' ]; then
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  docker push caronae/php
fi

