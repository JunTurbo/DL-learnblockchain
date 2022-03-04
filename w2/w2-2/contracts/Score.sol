//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Score {
    address public owner;

    mapping(address => uint256) scores;
    mapping(address => bool) teachers;

    modifier OnlyOwner{
        require(msg.sender == owner, "only owner!");
        _;
    }

    modifier OnlyTeacher{
        require(teachers[msg.sender], "only teacher!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function updateScore(address _student, uint256 _score) external OnlyTeacher {
        require(_score <= 100, "");
        scores[_student] = _score;
    }

    function addTeacher(address _teacher, bool _stat) external OnlyOwner {
        teachers[_teacher] = _stat;
    }
}
