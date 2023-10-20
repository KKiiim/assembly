import assert from "node:assert";
import { processor } from "../src/add-from-ts.js";
import { test, suite } from "mocha";
//------------------------------------------------------------------------------
// Tests
//------------------------------------------------------------------------------
suite("ts-add", () => {
  test("ts-add", async () => {
    const result = await processor.getResult();
    assert.strictEqual(result, 8);
  });
});
