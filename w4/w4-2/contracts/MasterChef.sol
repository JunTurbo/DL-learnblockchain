pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MasterChef {
    using SafeMath for uint256;

    // token -> user -> amount
    mapping(address => mapping(address => uint256)) user;

    mapping(address => uint256) total;

    constructor() {
    }

    function deps(address _token, address _user) external {
        uint256 t = IERC20(_token).balanceOf(address(this));
        uint256 amount = t.sub(total[_token]);
        if (amount > 0) {
            user[_token][_user] = user[_token][_user].add(amount);
        }
        total[_token] = IERC20(_token).balanceOf(address(this));
    }

    function withdraw(address _token, uint256 _amount) external {
        require(user[_token][msg.sender] >= _amount, "");
        user[_token][msg.sender] = user[_token][msg.sender].sub(_amount);
        IERC20(_token).transfer(msg.sender, _amount);
        total[_token] = IERC20(_token).balanceOf(address(this));
    }
}
