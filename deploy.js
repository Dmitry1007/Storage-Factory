const ethers = require("ethers");
// read from the .abi and .bin files
const fs = require("fs");

async function main() {
  const provider = new ethers.provider.JsonRpcProvider(/* url */);
  const wallet = new ethers.Wallet("private key", provider);
}

main()
  .then(() => ProcessingInstruction.exit(0))
  .catch((error) => {
    console.error(error);
    ProcessingInstruction.exit(1);
  });
