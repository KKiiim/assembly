import fs from "node:fs";

async function getResult() {
    const mydir = __dirname + "/../build/mysum.wasm";
    const content = await fs.promises.readFile(mydir);
    
    const module = await WebAssembly.instantiate(content);
    const addFunc = module.instance.exports.add as CallableFunction;
    const result = addFunc(5, 3);
    return result;
}
export const processor = {getResult};
