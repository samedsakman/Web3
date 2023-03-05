//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Functions{

    uint luckyNumber = 7;

    function showNumber() public view returns(uint) {
        return luckyNumber;
    }

    function setNumber(uint newNumber) public {
        luckyNumber = newNumber;
    }

    function birdenFazlaVeriDonen () public pure returns(uint, bool, bool){
        return (5, true, false); //returns içinde sadece tip belirttik.
    }

    //view: statedeki veriyi okumak için kullanılır
    //pure: herhangi bir veri okumadan kendi içinde işlem yapmak için kullanılır.

    function birdenFazlaVeriDonen2 () public pure returns( uint x, bool y, bool z){
        x = 6;
        y = true;
        z = false; //returns içinde tip ve değişken adı kullandık bu yüzden return kelimesi kullanmamız gerekmiyor.
    }


}
