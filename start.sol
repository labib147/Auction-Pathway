// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.4.0 < 0.9.0;

contract Auction{
  mapping(address => uint) bidderdata;


//bidding

function bidNow() public payable{

}

// get Contract balance (test)

function getBalance() public view returns(uint) {
return address(this).balance;
 }
}
