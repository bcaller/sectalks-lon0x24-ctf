#!/usr/bin/env bash
git archive -o ctf.zip @
aws s3 cp ctf.zip s3://bc-ctf/ctf.zip

aws s3 cp hangul/flag.enc s3://bc-ctf/hangul-flag.enc --content-type text/plain --acl public-read
aws s3 cp short-flag-zip/short-flag.zip s3://bc-ctf/short-flag.enc --acl public-read
aws s3 cp wasm/wasm.zip s3://bc-ctf/wasm.zip --acl public-read
