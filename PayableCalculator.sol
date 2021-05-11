// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PayableCalculator {
       function add(int256 a,int256 b) public  returns (int256 result) {
        _setCountOperation() ;
        deposit();
        return a + b;
    }
    
    function sub(int256 a,int256 b) public  returns (int256) {
        _setCountOperation();
        deposit();
        return   a - b;
    }
    
    function mul(int256 a,int256 b) public  returns (int256) {
        _setCountOperation();
        deposit();
       return  a * b;
    }
    
    function div(int256 a,int256 b) public  returns (int256) {
        require(b !=0, "Cal: can not divide by 0");
        _setCountOperation();
        return    a / b;
    }
}