import assert from "node:assert";
import { processor } from "../src/as-qsort.js";
import { test, suite } from "mocha";
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
suite("as-qsort", () => {
  test("as-qsort", async () => {
    const result = await processor.getResult();
    const rArray = [0, 1, 2, 3, 4, 5];
    for(let i = 0; i < rArray.length; i++){
        assert.strictEqual(result[i], rArray[i]);
    }
  });
});
