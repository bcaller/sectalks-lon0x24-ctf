#!/usr/bin/env node

const assert = require('assert');
const fs = require('fs');
const buf = fs.readFileSync(process.argv[2]);
const expected = process.argv[3];

(async () => {
  // Instantiate the Wasm module with an implicit compilation step.
  const { instance, module } = await WebAssembly.instantiate(buf);
  wasm = instance.exports

  console.log("Checking success...")
  assert(wasm.chkLn(expected.length));
  expected.split("").forEach((c, i) => assert(wasm.chkChr(i, c.charCodeAt(0))));

  console.log("Checking failure...")
  assert.equal(wasm.chkLn(expected.length - 1), 0);
  assert.equal(wasm.chkChr(0, 1), 0);

  console.log('It works');
})();

