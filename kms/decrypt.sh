#!/usr/bin/env bash
set -eu
aws --region eu-west-2 --profile ctf-limited kms decrypt \
    --grant-tokens $(cat grant.txt | jq -r ".GrantToken") \
    --ciphertext-blob fileb://flag.enc \
    --output text --query Plaintext | base64 --decode
