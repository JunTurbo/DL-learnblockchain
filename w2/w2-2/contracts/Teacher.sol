//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IScore {
    function updateScore(address _student, uint256 _score) external;
}

contract Teacher {

    IScore public score;

    constructor(address _teacher) {
        score = IScore(_teacher);
    }

    function updateScore(address _student, uint256 _score) external {
        require(_score <= 100, "");
        score.updateScore(_student, _score);
    }

}
