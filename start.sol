pragma solidity >0.4.0 < 0.9.0

contract Auction{
  mapping(address => uint) bidder data
}

//bidding

function bid() public payable {

}

// get Contract balance (test)

function getBalance() public view returns {
return address(this).balance;
}
