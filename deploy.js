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
  // you get receipt when you wait for one block confirmation
  const transactionReceipt = await contract.deployTransaction.wait(1);
  console.log("Here is the deployment transaction (tx response): ");
  console.log(contract.deploymentTransaction);
  console.log("Here is the transaction receipt: ");
  console.log(transactionReceipt);
}

main()
  .then(() => ProcessingInstruction.exit(0))
  .catch((error) => {
    console.error(error);
    ProcessingInstruction.exit(1);
  });
