// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/ReentrancyGuard.sol";

contract Bank is ReentrancyGuard{

    mapping(address => uint) public  balances; 

    function deposite() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() nonReentrant public {
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

contract Attack{
    Bank public exploit; //<name of thetaget contract> as astate avrible called <exploit>

    constructor(address _exploitAddress){
        exploit = Bank(_exploitAddress);
    }

    fallback() external payable { 
        if(address(exploit).balance >= 1 ether){
            exploit.withdraw();
        }
    }

    function attack() public  payable {
        require(msg.value >= 1 ether);
        exploit.deposite{value: 1 ether}();
        exploit.withdraw();
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}