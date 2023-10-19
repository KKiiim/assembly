const fs = require('fs');

// 异步加载 .wasm 文件
function getResult() {
  return new Promise((resolve, reject) => {
    const mydir = __dirname + "/../build/mysum.wasm"
    fs.readFile(mydir, (error, buffer) => {
      if (error) {
        console.error("Failed to load WebAssembly module:", error);
        reject(error);
        return;
      }

      const wasmCode = new Uint8Array(buffer);

      WebAssembly.instantiate(wasmCode)
        .then((wasmModule) => {
          const sumFunc = wasmModule.instance.exports.add;
          const result = sumFunc(5,3);
          console.log(result); // 输出：8
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