#!/usr/bin/env bash
set -u
NAME="$(basename $(pwd))-shiro"

echo "$SHIRO_FLAG" > /dev/null

docker stop $NAME
docker rm $NAME

docker build -f Dockerfile.shiro . -t $NAME
docker create \
  -p "${1:-8001}:8080" \
  -e SHIRO_FLAG \
  --name $NAME \
  $NAME
docker start $NAME

docker ps

# e.g. sudo ./run-docker.sh 1234
