const assert = require("assert");
const mydir = __dirname + "/../src/qsort.cjs"
const { getResult } = require(mydir);

const { test, suite } = require("mocha");

async function runTests() {
  suite("qsort", () => {
    test("qsort", async () => {
      const result = await getResult();
      const rArray = [0, 1, 2, 3, 4, 5];
    //  const rArray = [0, 0, 1, 2, 3, 4];
    for(let i = 0; i < rArray.length; i++){
      assert.strictEqual(result[i], rArray[i]);
    }
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