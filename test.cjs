const Mocha = require('mocha');
const fs = require('fs');
const path = require('path');

const mocha = new Mocha();
const testDir = path.join(__dirname, 'test');

fs.readdirSync(testDir).forEach((file) => {
  if (file.endsWith('.cjs')) {
    mocha.addFile(path.join(testDir, file));
  }
});

// 配置 Mocha
mocha.reporter('spec');

mocha.run((failures) => {
  process.exitCode = failures ? 1 : 0;
});