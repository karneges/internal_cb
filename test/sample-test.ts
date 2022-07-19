import { Signer } from "locklift";

let signer: Signer;

describe("Test Sample contract", async function () {
  before(async () => {
    signer = (await locklift.keystore.getSigner("0"))!;
  });
  describe("Contracts", async function () {
    it("should rejected with code 60", async function () {
      const { contract: sampleContract } = await locklift.factory.deployContract({
        contract: "Sample",
        publicKey: signer.publicKey,
        initParams: { _nonce: locklift.utils.getRandomNonce() },
        value: locklift.utils.toNano(1000000),
        constructorParams: {},
      });
      const { code } = locklift.factory.getContractArtifacts("Mock");
      await locklift.tracing.trace(
        sampleContract.methods
          .deployAndGetNumber({ mockCode: code, randomNonce: locklift.utils.getRandomNonce() })
          .sendExternal({ publicKey: signer.publicKey }),
        {},
      );
    });
  });
});
