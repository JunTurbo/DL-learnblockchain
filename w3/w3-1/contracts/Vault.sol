//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault {

    using SafeMath for uint256;

    address public token;
    mapping(address => uint256) public userDeposite;
    constructor(address _token) {
        token = _token;
    }

    function deposite(uint256 _amount) external {
        require(_amount > 0, "");
        IERC20(token).transferFrom(msg.sender, address(this), _amount);
        userDeposite[msg.sender] = userDeposite[msg.sender].add(_amount);
    }

    function withdraw(uint256 _amount) external {
        require(userDeposite[msg.sender] >= _amount, "");
        userDeposite[msg.sender] = userDeposite[msg.sender].sub(_amount);
        IERC20(token).transfer(msg.sender, _amount);
    }
}
