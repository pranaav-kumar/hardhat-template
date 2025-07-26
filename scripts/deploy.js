const hre = require("hardhat");

async function main() {
  // Get the contract factory
  const Simple = await hre.ethers.getContractFactory("Simple");

  // Deploy the contract
  const contract = await Simple.deploy();

  // Wait for deployment to finish
  await contract.waitForDeployment();

  // Get and print contract address
  const contractAddress = await contract.getAddress();
  console.log("✅ Contract deployed at:", contractAddress);
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
