import fs from "node:fs";

async function getResult() {
    const mydir = __dirname + "/../build/mysum_n.wasm";
    const content = await fs.promises.readFile(mydir);
    
    const module = await WebAssembly.instantiate(content);
    const nsumFunc = module.instance.exports.n_sum as CallableFunction;
    const result = nsumFunc(5);
    return result;
}
export const processor = {getResult};
