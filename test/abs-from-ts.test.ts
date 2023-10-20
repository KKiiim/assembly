import assert from "node:assert";
import { processor } from "../src/abs-from-ts.js";
import { test, suite } from "mocha";
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
suite("ts-abs", () => {
  test("ts-abs", async () => {
    const result = await processor.getResult();
    assert.strictEqual(result, 99);
  });
});
