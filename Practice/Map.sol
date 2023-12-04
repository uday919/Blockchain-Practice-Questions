// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22<=0.8.18;
contract mapExample{
    mapping(uint=>bool)map;
    function set(uint key,bool value)public{
        map[key]=value;
    }
    function get(uint key)public view returns(bool){
        return map[key];
    }
}