#!/usr/bin/env bash
set -eu
echo -n "flag{beware_expl0ding_h0rse}" > flag.txt
aws kms encrypt \
    --key-id a969da5b-61a1-4013-91e7-dd70cd97970d \
    --plaintext fileb://flag.txt \
    --output text \
    --query CiphertextBlob | base64 \
    --decode > flag.enc
aws kms create-grant \
  --key-id a969da5b-61a1-4013-91e7-dd70cd97970d \
  --grantee-principal "arn:aws:iam::884891558495:user/ctf-limited" \
  --operations Decrypt Encrypt | tee grant.txt
