// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("TSTERC721", "TST") {
    }

    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    function getOwnerTokenIdList() external view returns (uint256[] memory) {
        uint currentIndex = 0;
        uint256[] memory tokens = new uint256[](balanceOf(msg.sender));
        for (uint i = 1; i <= _tokenIds.current(); i++) {
            if (ownerOf(i) == msg.sender) {
                tokens[currentIndex] = i;
                currentIndex ++;
            }
        }
        return tokens;
    }
}