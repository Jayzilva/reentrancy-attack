# reentrancy-attack

<img src="img/before.PNG">
<img src="img/after.PNG">

<a href="Contract.sol">Contract</a> somply use updating balance before transaction to prevent reentrancy attack

<a href="GuardContract.sol">Guard Contract</a> use <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/ReentrancyGuard.sol">ReentrancyGuard by Openzeppelin</a>

<img src="img/guard.PNG">