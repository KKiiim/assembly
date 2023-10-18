const fs = require('fs');

// 异步加载 .wasm 文件
function getResult() {
  return new Promise((resolve, reject) => {
    const mydir = __dirname + "/../build/myabs.wasm"
    fs.readFile(mydir, (error, buffer) => {
      if (error) {
        console.error("Failed to load WebAssembly module:", error);
        reject(error);
        return;
      }

      const wasmCode = new Uint8Array(buffer);

      WebAssembly.instantiate(wasmCode)
        .then((wasmModule) => {
          const absFunc = wasmModule.instance.exports.abs;

          // 调用函数并获取结果
          const result = absFunc(-99);
          console.log(result); // 输出：99
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