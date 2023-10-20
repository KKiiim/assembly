import assert from "node:assert";
import { processor } from "../src/c-qsort.js";
import { test, suite } from "mocha";
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
suite("c-qsort", () => {
  test("c-qsort", async () => {
    const result = await processor.getResult();
    const rArray = [0, 1, 2, 3, 4, 5];
    //const rArray = [5, 1, 3, 2, 4, 0];
    for(let i = 0; i < rArray.length; i++){
        assert.strictEqual(result[i], rArray[i]);
    }
  });
<<<<<<< HEAD
});
=======
});
>>>>>>> 951115b (Create c-qsort.test.ts)
