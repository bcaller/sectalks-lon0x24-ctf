#!/usr/bin/env bash
echo -n "${SHORT_ZIP_FLAG:-flag{sW1m\}}" > flag.txt
zip -e -P "$(head -c 32 /dev/urandom)" -v short-flag.zip flag.txt
rm flag.txt
