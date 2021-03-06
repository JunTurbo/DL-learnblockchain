require("@nomiclabs/hardhat-waffle");
const fs = require("fs");
const privateKey1 = fs.readFileSync("./.pr", "utf-8");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    // defaultNetwork: "hardhat",
    hardhat: {
      chainId: 31337
    },
    okTestnet: {
      url: "https://exchaintestrpc.okex.org",
      accounts: [privateKey1]
    }
  },
  solidity: "0.8.4",

};
