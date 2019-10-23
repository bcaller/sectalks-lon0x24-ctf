#!/usr/bin/env bash
NAME=$(basename $(pwd))

docker stop $NAME
docker rm $NAME

docker build . -t $NAME
docker create \
  -p "${1:-8000}:8080" \
  -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION \
  --name $NAME \
  $NAME
docker start $NAME

docker ps

# e.g. sudo ./run-docker.sh 1234
