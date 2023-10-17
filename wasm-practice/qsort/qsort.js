const fs = require('fs');

// 异步加载 .wasm 文件
function getResult() {
  return new Promise((resolve, reject) => {
    fs.readFile("qsort.wasm", (error, buffer) => {
      if (error) {
        console.error("Failed to load WebAssembly module:", error);
        reject(error);
        return;
      }

      const wasmCode = new Uint8Array(buffer);

      WebAssembly.instantiate(wasmCode)
        .then((wasmModule) => {
          const qsortFunc = wasmModule.instance.exports.myqsort;
          const jsArray = [5, 1, 3, 2, 4, 0];
          // 调用函数并获取结果
          qsortFunc(jsArray, 0, 5);
          console.log(jsArray);
          resolve(jsArray);
        })
        .catch((error) => {
          console.error("Failed to instantiate WebAssembly module:", error);
          reject(error);
        });
    });
  });
}
module.exports = { getResult };