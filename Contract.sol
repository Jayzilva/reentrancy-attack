// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank{

    mapping(address => uint) public  balances; 

    function deposite() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0 );
        (bool sent,) = msg.sender.call{value : bal}("");
        require(sent, "Fail to send ");

        balances[msg.sender] = 0;
    }

    function getBalance() public  view returns(uint) {
        return address(this).balance;
    }
}