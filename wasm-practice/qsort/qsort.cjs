const fs = require('fs');

// 异步加载 .wasm 文件
function getResult() {
  return new Promise((resolve, reject) => {
    fs.readFile("./wasm-practice/qsort/myqsort.wasm", (error, buffer) => {
      if (error) {
        console.error("Failed to load WebAssembly module:", error);
        reject(error);
        return;
      }

      const wasmCode = new Uint8Array(buffer);

      WebAssembly.instantiate(wasmCode)
        .then((wasmModule) => {
          const qsortFunc = wasmModule.instance.exports.myqsort;
          const js2wasm = wasmModule.instance.exports.js2wasm;
          const wasm2js = wasmModule.instance.exports.wasm2js;
          const jsArray = [5, 1, 3, 2, 4, 0];
        //  const jsArray = [5, 4, 3, 2, 1, 0];
          console.log(jsArray);

          for (let i = 0; i < jsArray.length; i++) {
            js2wasm(jsArray[i], i);
          }

          qsortFunc(0, jsArray.length);

          for (let i = 0; i < jsArray.length; i++){
            jsArray[i] = wasm2js(i+1);
          }


          // for (let i = 0; i < jsArray.length; i++){
          //     jsArray[i] = wasm2js(jsArray.length - i - 1);
          //     console.log(wasm2js(i));
          // }
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