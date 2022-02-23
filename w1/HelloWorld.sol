//SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract HelloWorld {

    string private str;

    constructor(string memory _s){
        str = _s;
    }

    function say() external view returns(string memory){
        return str;
    }

    function setStr(string memory _s) external {
        str = _s;
    }
}
