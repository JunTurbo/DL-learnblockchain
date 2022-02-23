const hre = require("hardhat");

async function main() {

    // deploy
    const helloC = await hre.ethers.getContractFactory("HelloWorld");
    const hello = await helloC.deploy("Hello World!");

    await hello.deployed();

    console.log("HelloWord deployed to:", hello.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
