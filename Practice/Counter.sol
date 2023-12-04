// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.8.18;
contract counter{
    uint256 public count;
    function increment() external{
        count++;
    }
    function decrement() external{
        count--;
    }
    function reset() external{
        count=0;
    }
    function addBY(uint256 value) external{
        count+=value;
    }
    function subtractBy(uint256 value) external{
        count-=value;
    }
    function multiplyBy(uint256 value) external{
        count*=value;

    }
    function getminutesElapsed() external view returns (uint256){
        return count/uint256(60);
    }

}