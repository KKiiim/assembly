import assert from "node:assert";
import { processor } from "../src/sum_n-from-ts.js";
import { test, suite } from "mocha";
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
suite("ts-sum_n", () => {
  test("ts-sum_n", async () => {
    const result = await processor.getResult();
    assert.strictEqual(result, 15);
  });
});
