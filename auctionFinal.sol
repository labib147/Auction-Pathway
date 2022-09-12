//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Auction{

  //uint256 prizeEth = 3;
  mapping(address => uint) biddersData;
  uint256 highestBid;
  uint256 minBid = 1e18;
  uint256 maxBid = 10e18;
  address highestBidder;
  address owner;
  uint startTime = block.timestamp;
  uint endTime;
  string win = "Claim your NFT";
  
  address[] bidders;

    constructor(){
        owner = msg.sender;
    }
    
    //bidding
    function bidNow() public payable {
        if (bidders.length > 0){
            require(bidders[bidders.length - 1] != msg.sender, "Sorry you are the last bidder");   
        }
        
        uint totalBid = biddersData[msg.sender] + msg.value;
        require(block.timestamp<endTime, "Auction ended");
        require(msg.value> 0, "Value has to be more than 0");
        require(msg.value> minBid, "Warning, Cannot bid lower than Minimum Limit");
        require(msg.value< maxBid, "Warning, Cannot bid higher than Maximum Limit");

        // check highest bid
        require(totalBid>highestBid, "Cannot bid lower than highest bid");
        biddersData[msg.sender] = totalBid;
        highestBid = totalBid;
        highestBidder = msg.sender;
        bidders.push(msg.sender);
    }

    // checking array values
    function array()public view returns(address[] memory){
    return bidders;
    }
    // get Contract balance (test)

    function getBiddersBid(address _address) public view returns(uint){
        return biddersData[_address]; //return address(this).balance; #to get balance of the contract    
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
    function timeStop(uint _endTime) public{
        endTime = _endTime;
    }

    //withdraw bid
    function refund() public{   
        //return biddersData[msg.sender]; 
        require(msg.sender != highestBidder, "Winner can not claim refund");       
        (bool success, ) = payable(msg.sender).call{value: biddersData[msg.sender]}(""); 
        require(success, "refund failed");       
    }
    function claimPrize() public view returns (string memory) {
        require(msg.sender == highestBidder, "Only the winner can claim the prize");
        return win;        
    }


    modifier onlyOwner(){
        require(owner == msg.sender, "Only the Owner can claim Winning Money");        
        _;
    }
    function claimWinningMoney() external onlyOwner{        
        (bool success, ) = payable(msg.sender).call{value: biddersData[msg.sender]}(""); 
        require(success, "refund failed");
    }
}
