"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.processor = void 0;
const node_fs_1 = __importDefault(require("node:fs"));
function getResult() {
    return __awaiter(this, void 0, void 0, function* () {
        const mydir = __dirname + "/../build/myc-qsort.wasm";
        const content = yield node_fs_1.default.promises.readFile(mydir);
        const module = yield WebAssembly.instantiate(content);
        const myqsort = module.instance.exports.myqsort;
        const getter = module.instance.exports.getter;
        // const memm = module.instance.exports.memory as WebAssembly.Memory;
        // console.log(memm.buffer);
        // const a =  memm.buffer.slice(1024);
        // console.log(a);
        const rArray = new Array();
        myqsort(0, 5);
        for (let index = 0; index < 6; index++) {
            rArray[index] = getter(index);
        }
        return rArray;
    });
}
exports.processor = { getResult };
