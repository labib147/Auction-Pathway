// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Auction{
  mapping(address => uint) biddersData;

    //bidding

    function bidNow() public payable{
        require(msg.value<0, "Value has to be more than 0");
    }

    // get Contract balance (test)

    function getBiddersBid() public payable returns(uint) {
        return biddersData[msg.sender] = msg.value;

    //return address(this).balance;
    }
}
