const fs = require("fs");

function getResult() {
  return new Promise((resolve, reject) => {
    const mydir = __dirname + "/../build/mysum_n.wasm"
    fs.readFile(mydir, (error, buffer) => {
      if (error) {
        console.error("Failed to load WebAssembly module:", error);
        reject(error);
        return;
      }

      const wasmCode = new Uint8Array(buffer);

      WebAssembly.instantiate(wasmCode)
        .then((wasmModule) => {
          const nsumFunc = wasmModule.instance.exports.n_sum;
          const result = nsumFunc(5);
          console.log(result); // 输出：15
          resolve(result);
        })
        .catch((error) => {
          console.error("Failed to instantiate WebAssembly module:", error);
          reject(error);
        });
    });
  });
}

module.exports = { getResult };