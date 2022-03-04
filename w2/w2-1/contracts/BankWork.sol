//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract BankWork {
    using SafeMath for uint256;

    address public owner;
    uint256 public total;

    mapping(address => uint256) balance;
    modifier OnlyOwner{
        require(msg.sender == owner, "only owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function deposit() payable external {
        require(msg.value > 0, "");
        balance[msg.sender] = balance[msg.sender].add(msg.value);
        total = total.add(msg.value);
    }

    function withdraw(uint256 _amount) payable external {
        require(balance[msg.sender] > _amount, "");
        balance[msg.sender] = balance[msg.sender].sub(msg.value);
        total = total.sub(msg.value);
    }

    function withdrawAllByOwner() payable OnlyOwner external {
        (bool success,) = owner.call{value : total}("");
        require(success, "Failed to send Ether");
    }
}
