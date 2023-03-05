//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract variables{

    //state variables : kontrat scope'una yazılan değişkenler kontratın her yerinden ulaşılabilir.
    string public bestClub = "itu blockchain";

    //global variables
    block.timestamp;
    block.difficulty;
    block.gaslimit;
    msg.sender;
    msg.value;
    msg.data;

    bool isTrue = true;

    int number = 12; // varsayılan olarak int256'ya eşit => -2^256 to 2^256, int8 => -2^8 to 2^8
    uint number2 = 15; // unsigned integer - değer almıyor.

    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Solidity'e özel değişken. Boyutu 20byte uzunluğunda ve sabit.
    bytes32 name1 = "blockchain"; //bytes1 to bytes32
    string name2 = "blockchain";

    uint[] array = [1,2,3,4];
    mapping(uint => address) list; // ben bir anahtar kelime söyleyeceğim ve bu anahtar bir değer tutacak
    list[3] = "samed";

    //User defined value types
    struct Human {
        uint Id;
        string name;
        uint age;
        address _address;
    }

    //struct yapısı class yapısına benzer

    // mapping(uint => Human) list2;

    Human person1;
    person1.Id = 2311131;
    person1.name = "Samed";
    person1.age = 33;
    person1._address = 0x.....;

    enum trafficLight {
        RED,
        YELLOW,
        GREEN
    }

    //trafficLight.GREEN;

    1 wei = 1;
    1 ether = 10^18 wei;
    1 gwei = 10^9 wei;

    1 = 1 sec
    
}