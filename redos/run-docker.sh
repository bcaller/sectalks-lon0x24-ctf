#!/usr/bin/env bash
NAME=$(basename $(pwd))

docker stop $NAME
docker rm $NAME

docker build . -t $NAME
docker create \
  --read-only \
  -p "${1:-1234}:1234" \
  -e REDOS_FLAG \
  -e REGEX_ID \
  -e MAXCHARS \
  --name $NAME \
  $NAME
docker start $NAME

docker ps

# e.g. sudo REDOS_FLAG="flag{the_flag}" REGEX_ID=0 MAXCHARS=300 ./run-docker.sh 1234
# e.g. sudo REDOS_FLAG="flag{the_flag}" REGEX_ID=1 MAXCHARS=4321 ./run-docker.sh 1234
