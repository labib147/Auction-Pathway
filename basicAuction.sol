// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Auction{
  mapping(address => uint) biddersData;
  uint highestBid;
  address highestBidder;

    //bidding

    function bidNow() public payable{
        uint totalBid = biddersData[msg.sender] + msg.value;
        require(msg.value>0, "Value has to be more than 0");

        // check highest bid
        require(totalBid>highestBid, "Cannot bid lower than highest bid");
        biddersData[msg.sender] = totalBid;
        highestBid = totalBid;
        highestBidder=msg.sender;
    }
        // get Contract balance (test)

    function getBiddersBid(address _address) public view returns(uint){
        return biddersData[_address];

        //return address(this).balance; // to get balance of the contract
    }
    // highest bid
    function highestBidValue() public view returns (uint){
        return highestBid;
    }

    //highest bidder
    function highestBidderValue() public view returns (address){
        return highestBidder;
    }
}
