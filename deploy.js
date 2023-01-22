const ethers = require("ethers");
// read from the .abi and .bin files
const fs = require("fs");

async function main() {
  const provider = new ethers.provider.JsonRpcProvider(/* url */);
  const wallet = new ethers.Wallet("private key goes here", provider);
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("Deploying, please wait...");
  const contract = await contractFactory.deploy();
  contract.log(contract);
}

main()
  .then(() => ProcessingInstruction.exit(0))
  .catch((error) => {
    console.error(error);
    ProcessingInstruction.exit(1);
  });
