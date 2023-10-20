import fs from "node:fs";

async function getResult() {
    const mydir = __dirname + "/../build/as-qsort.wasm";
    const content = await fs.promises.readFile(mydir);
    
    const module = await WebAssembly.instantiate(content);
    const myqsort = module.instance.exports.myqsort as CallableFunction;
    const getter = module.instance.exports.getter as CallableFunction;

    const rArray = new Array<number>();
    myqsort(0, 5);

    for (let index = 0; index < 6; index++){
        rArray[index] = getter(index);
    }

    return rArray;
}
export const processor = {getResult};
