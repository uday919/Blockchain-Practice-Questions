// SPDX-License-Identifier: MIT
pragma solidity >=0.7.22<=0.8.18;
contract DebtTracking{
    mapping(address=>mapping(address=>uint))Debt;
    function addDebt(address toBePaidAddress,address payingAddress,uint amount)public{
        Debt[toBePaidAddress][payingAddress]+=amount;

    }
    function payDebt(address toBePaidAddress,address payingAddress,uint amount)public {
        uint amountOwed=Debt[toBePaidAddress][payingAddress];
        if(amount>amountOwed){
            uint change=amount-amountOwed;
            Debt[toBePaidAddress][payingAddress]=0;
            Debt[payingAddress][toBePaidAddress]+=change;
        }else{
            Debt[toBePaidAddress][payingAddress]-=amount;
        }



    }
    function getDebt(address owedAddress,address payingAddress) public view returns(uint){
        return Debt[owedAddress][payingAddress];
    }
    }