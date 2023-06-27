//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Counter {
    uint public count;
    address public sender = msg.sender;

    function get() public view returns (uint){
        return count;
    }

    function inc() public {
        count += 1;
    }
    function dec() public {
        count -= 1;
    }

    function reset() public{
        count = 0;
    }
}
