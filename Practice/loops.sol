// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0<0.9.0;
contract loops{
    function test(uint maxLoops)public pure returns(uint){
        uint sum=0;
        for(uint i=0;i<maxLoops;i++){
            sum+=1;
        }
        return sum;

    }
}