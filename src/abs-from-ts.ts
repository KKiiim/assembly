import fs from "node:fs";

async function getResult() {
    const mydir = __dirname + "/../build/myabs.wasm";
    const content = await fs.promises.readFile(mydir);
    
    const module = await WebAssembly.instantiate(content);
    const absFunc = module.instance.exports.abs as CallableFunction;
    const result = absFunc(-99);
    return result;
}
export const processor = {getResult};
