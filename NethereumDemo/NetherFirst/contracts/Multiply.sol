// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract test {
    int _multiplier;
    event Multiplied(int indexed a, address indexed sender, int result);

    function multi(int multiplier) public {
        _multiplier = multiplier;
    }

    function multiply(int a) public returns (int r){
        r = a * _multiplier;
        emit Multiplied(a, msg.sender, r);
        return r;
    }

}