// SPDX-License-Identifier: MIT
pragma solidity >=0.7.22<=0.8.18;
contract fallBack{
    uint public received;
    uint public fallbackReceived;
    uint public payRecieved;
    function pay() external payable{
        payRecieved+= msg.value;

    }
    receive() external payable {
        received+=msg.value;
     }
     fallback() external payable {
        fallbackReceived+=msg.value;
     }
}