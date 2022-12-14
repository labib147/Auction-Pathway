//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Auction{

  uint256 prizeEth = 3;
  mapping(address => uint) biddersData;
  uint256 highestBid;
  address highestBidder;
  uint startTime = block.timestamp;
  uint endTime;
  
  address[] bidders;
    //bidding

    function bidNow() public payable{
        require(bidders[bidders.length - 1] == msg.sender, "Sorry you are the last bidder");

        uint totalBid = biddersData[msg.sender] + msg.value;
        require(block.timestamp<endTime, "Auction ended");
        require(msg.value>0, "Value has to be more than 0");

    // check highest bid
        require(totalBid>highestBid, "Cannot bid lower than highest bid");
        biddersData[msg.sender] = totalBid;
        highestBid = totalBid;
        highestBidder = msg.sender;

        bidders.push(msg.sender);
    }
    // get Contract balance (test)

    function getBiddersBid(address _address) public view returns(uint){
        return biddersData[_address];

    //return address(this).balance; //\\ to get balance of the contract
    }
    // highest bid
    function highestBidValue() public view returns (uint){
        return highestBid;
    }

    //highest bidder
    function highestBidderValue() public view returns (address){
        return highestBidder;
    }

    // endTime
    function timeStop(uint _endTime) public {
        endTime = _endTime;
    }

    //withdraw bid
    function withdrawBid(address payable _address) public onlyowner {
        if (biddersData[_address]>0){
            _address.transfer(biddersData[_address]);
        }
    }
}
