const fs = require('fs');

// 异步加载 .wasm 文件
fs.readFile('mysum_n.wasm', (error, buffer) => {
  if (error) {
    console.error('Failed to load WebAssembly module:', error);
    return;
  }

  // 将二进制数据转换为 Uint8Array
  const wasmCode = new Uint8Array(buffer);

  // 加载并实例化 WebAssembly 模块
  WebAssembly.instantiate(wasmCode)
    .then(wasmModule => {
      // 获取导出的函数
      const nsumFunc = wasmModule.instance.exports.n_sum;

      // 调用函数并获取结果
      const result = nsumFunc(5);
      console.log(result); // 输出：15
    })
    .catch(error => {
      // 处理实例化错误
      console.error('Failed to instantiate WebAssembly module:', error);
    });
});