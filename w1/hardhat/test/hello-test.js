const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("HelloWorld", function () {
    it("Should return the new hello once it's changed", async function () {
        const helloC = await ethers.getContractFactory("HelloWorld");
        const hello = await helloC.deploy("Hello world!");
        await hello.deployed();

        let say = await hello.say();
        console.log(say);
        await hello.setStr("New,Hello world!");

        let newSay = await hello.say();
        console.log(newSay);

    });
});
