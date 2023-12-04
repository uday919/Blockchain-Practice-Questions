// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0<0.9.0;
contract HelloWorld{
    address owner;
    constructor(){
        owner=msg.sender;
    }
    receive() external payable { }

    function destroy() external{
        require(owner==msg.sender,"You are not the owner");
        selfdestruct(payable(owner));
    }
    function getOwner()public view returns(address){
        return owner;
    }

}