const Mocha = require('mocha');

// 创建 Mocha 实例
const mocha = new Mocha();

// 添加测试文件
mocha.addFile('./wasm-practice/abs_if/abs.test.cjs');
mocha.addFile('./wasm-practice/add2num/add.test.cjs');
mocha.addFile('./wasm-practice/sum-n/sum_n.test.cjs');
mocha.addFile('./wasm-practice/qsort/qqsort.test.cjs');

// 配置 Mocha
mocha.reporter('spec');

// 执行测试
mocha.run((failures) => {
  process.exitCode = failures ? 1 : 0;
});