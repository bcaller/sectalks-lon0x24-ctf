#!/usr/bin/env node
//usage: ./validate-wasm-flag.js flag.wasm flag{my_flag_guess}

const assert = require('assert');
const fs = require('fs');
const buf = fs.readFileSync(process.argv[2]); // flag.wasm
const expected = process.argv[3]; // flag{guess}

(async () => {
  // Instantiate the Wasm module with an implicit compilation step.
  const { instance, module } = await WebAssembly.instantiate(buf);
  wasm = instance.exports

  console.log("Checking...")
  assert(wasm.chkLn(expected.length));
  expected.split("").forEach((c, i) => assert(wasm.chkChr(i, c.charCodeAt(0))));

  console.log('You got it!');
})();

