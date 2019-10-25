#!/usr/bin/env bash
docker build . -t wasmy && \
  cp index.html out/index.html && \
  cp validate-wasm-flag.js out/validate-wasm-flag.js && \
  docker run --rm -v "$(pwd):/src:ro" -v "$(pwd)/out:/out" wasmy \
    /bin/ash -c \
      "/wabt-bin/wat2wasm /src/hi.wat -o /out/flag.wasm && /validate-wasm-flag.js /out/flag.wasm 'flag{assemble_oozy_haze}' && /check.js /out/flag.wasm 'flag{assemble_oozy_haze}'"

(
cd out;
zip wasm.zip flag.wasm index.html validate-wasm-flag.js;
mv wasm.zip ../;
)
