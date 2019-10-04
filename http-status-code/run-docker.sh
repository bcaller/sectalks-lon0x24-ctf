#!/usr/bin/env bash
NAME=$(basename $(pwd))

docker stop $NAME
docker rm $NAME

docker build . -t $NAME
docker create \
  --read-only \
  -p "${1:-8000}:8000" \
  -e STATUS_CODE_FLAG \
  --name $NAME \
  $NAME
docker start $NAME

docker ps

# e.g. sudo STATUS_CODE_FLAG="flag{d0wn_tH3_r4bb1t_wH0l3}" ./run-docker.sh 1234
