const hre = require("hardhat");

async function main() {

    let [a1, a2] = await ethers.getSigners();
    console.log(a1.address)
    const token = await hre.ethers.getContractFactory("TSToken");
    const tsToken = await token.deploy("TSToken", "TST");

    await tsToken.deployed();

    console.log("token deployed to:", tsToken.address);
    // let owner = await tsToken.owner();
    // console.log("owner: " + owner)

    await tsToken.mint(a1.address, ethers.utils.parseUnits("1000", 18).toString());
    let balance = await tsToken.balanceOf(a1.address);
    console.log(ethers.utils.formatUnits(balance, 18))

    const vaultT = await hre.ethers.getContractFactory("Vault");
    const vault = await vaultT.deploy(tsToken.address);

    await vault.deployed();
    console.log("vault deployed to:", vault.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
