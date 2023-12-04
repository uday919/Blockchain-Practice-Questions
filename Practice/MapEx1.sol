// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22<=0.8.22;
contract EaxmpleMap{
    mapping(uint=>int)quantities;
    function addItem(uint itemId,uint quantity)public{
        quantities[itemId]+=int256(quantity);
    }
    function getQuantity(uint itemId) public view returns(int){
         return quantities[itemId]!=0?int256(quantities[itemId]):-1;

    }
}