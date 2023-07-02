// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.6;

contract Mappings {
    //Mapping from address to uint
    mapping(address=>uint) public myMap;

    function get(address _addr) public view returns (uint){
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        //Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping {
    //Nested mapping (mapping from the address to another mapping)
    mapping(address=>mapping(uint=>bool)) private nested;
    function get(address _addr1, uint _i) public view returns (bool) {
        //You can get values from a nested mapping
        //even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}