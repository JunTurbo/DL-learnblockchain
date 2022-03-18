//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TSToken is ERC20, Ownable {
    constructor(string memory _name, string memory symbol_) ERC20(_name, symbol_){
        _mint(msg.sender, 21000000 * 10 ** 18);
    }
}
