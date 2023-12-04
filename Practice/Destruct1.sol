// SPDX-License-Identifier: MIT
pragma solidity >=0.7.22<0.9.0;
contract Competitors{

    address owner;

    address depositor1;
    address depositor2;
    address maxDepositor;

    uint256 depositor1Deposited;
    uint256 depositor2Deposited;

    bool withdrew;
    constructor(){
        owner=msg.sender;
    }
    function deposit()external payable{
        require(msg.value==1 ether,"you can only send exactly 1 ether");
        require(
            depositor1Deposited+depositor2Deposited<3 ether,"3 ether has been received,no more deposits are accepted"
        );
        if(depositor1==address(0)){
            depositor1=msg.sender;
        }else if(depositor2==address(0)){
            depositor2=msg.sender;
        }
        if (msg.sender==depositor1){
            depositor1Deposited+=msg.value;
        }else if(msg.sender==depositor2){
            depositor2Deposited=msg.value;

        }else{
            revert("you are not one of the valid depositors");

        }
        if(depositor1Deposited+depositor2Deposited>=3 ether){
            if(depositor1Deposited>depositor2Deposited){
                maxDepositor=depositor1;
            }else{
                maxDepositor=depositor2;
            }
        }
    }
    function withdraw()external{
        require(depositor1Deposited+depositor2Deposited>= 3 ether,"3 ether has not yet been recieved");
        require(msg.sender==maxDepositor,"you did not deposit the most ether");
        (bool sent,)=payable(maxDepositor).call{value:3 ether}("");
        require(sent,"not sent");
        withdrew=true;
    }
    function destroy() external{
        require(msg.sender==owner,"you are not the owner");
        require(
            withdrew==true,"max depositor has not yet withdrew their funds"
        );
        selfdestruct(payable(owner));
    }

}