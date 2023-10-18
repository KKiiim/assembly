const assert = require("assert");
const mydir = __dirname + "/../src/sum_n.cjs"
const { getResult } = require(mydir);

const { test, suite } = require("mocha");

async function runTests() {
  suite("sum_n", () => {
    test("sum_n", async () => {
      const result = await getResult();
      assert.strictEqual(result, 15);
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
