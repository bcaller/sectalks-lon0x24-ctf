FROM node:12-alpine
WORKDIR /wabt
RUN apk --no-cache add build-base cmake git python \
 && git clone --recursive https://github.com/WebAssembly/wabt /wabt \
 && mkdir build \
 && cd build \
 && cmake .. \
 && cmake --build . --target wat2wasm \
 && cmake --build . --target wasm-objdump \
 && mkdir /wabt-bin \
 && mv /wabt/build/* /wabt-bin \
 && rm -rf /wabt
COPY check.js /check.js
COPY validate-wasm-flag.js /validate-wasm-flag.js
