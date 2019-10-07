#!/usr/bin/env bash
docker build . -t wasmy && \
  cp index.html out/index.html && \
  docker run --rm -v "$(pwd):/src:ro" -v "$(pwd)/out:/out" wasmy \
    /bin/ash -c \
      "/wabt-bin/wat2wasm /src/hi.wat -o /out/flag.wasm && /check.js /out/flag.wasm 'flag{assemble_oozy_haze}'"
