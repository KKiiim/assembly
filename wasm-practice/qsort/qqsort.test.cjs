const assert = require("assert");
const { getResult } = require("./qsort.cjs");

const { test, suite } = require("mocha");

async function runTests() {
  suite("qsort", () => {
    test("qsort", async () => {
      const result = await getResult();
    //  const rArray = [0, 1, 2, 3, 4, 5];
      const rArray = [0, 0, 1, 2, 3, 4];
      assert.strictEqual(result, rArray);
    });
  });
}

runTests()
  .then(() => {
    console.log("All tests completed.");
  })
  .catch((error) => {
    console.error("Error running tests:", error);
  });