// SPDX-License-Identifier: MIT
pragma solidity >=0.7.22<=0.8.18;
contract HelloWorld{
    mapping(address=>uint)balances;
    function deposit()external payable {
        balances[msg.sender]+=msg.value;

    }
    function withdraw(uint amount)public{
        uint balance=balances[msg.sender];
        require(balance>=amount,"balance is not sufficient");
        balances[msg.sender]-=amount;
        payable(msg.sender).call{value:amount}("");
    }
}