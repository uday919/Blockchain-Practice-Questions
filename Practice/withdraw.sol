// SPDX-License-Identifier: MIT
pragma solidity >=0.7.22<=0.8.18;
contract withDraw{
    mapping(address=>uint)received;
    function withdraw() external {
        uint value=received[msg.sender];
        received[msg.sender]=0;
        payable(msg.sender).call{value:value}("");
    }
    receive() external payable { 
        received[msg.sender]+=msg.value;
    }
    fallback() external payable { 
        received[msg.sender]+=msg.value;
    }
}