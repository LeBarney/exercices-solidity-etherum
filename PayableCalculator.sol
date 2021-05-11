// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
     using Address for address payable;
    
    uint256 private calculTax;  
    address private _owner;
    uint256 private nbOperations;
    
    constructor(address owner_){
        _owner = owner_;
    }
    
    modifier tunes {
    require(msg.value == 1e15 , "Contract: you must pay 1 finney");
    calculTax += msg.value;
    nbOperations++;
    _;
    }   
    function add(int256 a,int256 b) public payable tunes returns (int256) {
        return a + b;
    }
    
    function sub(int256 a,int256 b) public payable tunes returns (int256) {
        return   a - b;
    }
    
    function mul(int256 a,int256 b) public payable tunes returns (int256) {
       return  a * b;
    }
    
    function div(int256 a,int256 b) public payable tunes returns (int256) {
        require(b !=0, "Cal: can not divide by 0");
        return    a / b;
    }
    function mod(int256 a,int256 b) public payable tunes returns (int256) {
        return a % b;
    }
    function withdraw() public {
        require(msg.sender == _owner, "y a que moi qu'ai le droit");
        uint256 amount = calculTax;
        calculTax = 0;
        payable(msg.sender).sendValue(amount);
    }
    function combienPognon()public view returns (uint256) {
        return calculTax;
    }
    function combienOperations()public view returns (uint256) {
        return nbOperations;
    }
}