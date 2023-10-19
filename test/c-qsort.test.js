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
const node_assert_1 = __importDefault(require("node:assert"));
const c_qsort_js_1 = require("../src/c-qsort.js");
const mocha_1 = require("mocha");
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
(0, mocha_1.suite)("c-qsort", () => {
    (0, mocha_1.test)("c-qsort", () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield c_qsort_js_1.processor.getResult();
        const rArray = [0, 1, 2, 3, 4, 5];
        //const rArray = [5, 1, 3, 2, 4, 0];
        for (let i = 0; i < rArray.length; i++) {
            node_assert_1.default.strictEqual(result[i], rArray[i]);
        }
    }));
});
