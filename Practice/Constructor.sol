// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0<0.9.0;
contract HelloWorld{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    receive() external payable { }
    function withdraw(uint amount) public{
        require(msg.sender==owner,"youre not the owner");
        require(address(this).balance>=amount,"not enough balance");
        (bool sent,)=payable(owner).call{value:amount}("");
        require(sent,"Failed to send");
    }
}