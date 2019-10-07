docker run --rm -v "$(pwd)/out:/wasm:ro" wasmy \
  /bin/ash -c "/wabt-bin/wasm-objdump -x /wasm/flag.wasm && /wabt-bin/wasm-objdump -d /wasm/flag.wasm"
