// SPDX-License-Identifier: MIT
pragma solidity >=0.4.11 <=0.8.18;
contract nested{
    mapping(string=>mapping(uint=>bool))nest;
    function studentSet(string memory name,uint roll,bool value)public {
        nest[name][roll]=value;
    }
    function StudentGet(string memory name,uint roll)public view returns(bool){
        return nest[name][roll];
    }

}