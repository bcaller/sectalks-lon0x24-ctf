#!/usr/bin/env bash
NAME=$(basename $(pwd))

docker stop $NAME
docker rm $NAME

docker build . -t $NAME
docker create \
  --read-only \
  -p "${1:-9000}:9000" \
  -e ORACLE_FLAG \
  -e ORACLE_KEY \
  --name $NAME \
  $NAME
docker start $NAME
docker exec -it $NAME python /encrypt.py | tee flag.enc

docker ps

# e.g. sudo ORACLE_KEY="abcdefghijklmnopqrstuvwx" ORACLE_FLAG="flag{abc}" ./run-docker.sh 1234
