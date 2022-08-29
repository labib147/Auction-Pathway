// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ownable{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    uint public x = 5;
     
    function contact() external onlyOwner{
        x += 5;
    }
}
