#!/usr/bin/env bash
git archive -o ctf.zip @
aws s3 cp ctf.zip s3://bc-ctf/ctf.zip

aws s3 cp hangul/flag.enc s3://bc-ctf/hangul-flag.enc --acl public-read
aws s3 cp short-flag-zip/short-flag.zip s3://bc-ctf/short-flag.enc --acl public-read
aws s3 cp wasm/wasm.zip s3://bc-ctf/wasm.zip --acl public-read
aws s3 cp kms/flag.enc s3://bc-ctf/zeppelin-ctf-flag-here/flag-ciphertext.enc
aws s3 cp kms/grant.txt s3://bc-ctf/zeppelin-ctf-flag-here/grant.txt
aws s3 cp battery/index.html s3://bc-ctf/power.html --acl public-read
