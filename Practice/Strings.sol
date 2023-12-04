// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0<0.9.0;
contract Hello{
    string public x="Hello";
    bytes public y="world";

    function byt()public view returns(string memory){
        return string(y);
    } 
    function test(string memory str) public pure returns(string memory){
        string memory newStr= string.concat(str,"s");
        return newStr;
    }
}