//SPDX-License-Identifier:MIT
pragma solidity^0.8.1;
contract MappingStructsExample{

    
    struct Payment{
        uint amount;
        uint timeStamp;
    }

    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint=>Payment) payments;
    }

    mapping(address=>Balance) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendMoney() public payable{
        balanceReceived[msg.sender].totalBalance+=msg.value;
        Payment memory payment = Payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
         balanceReceived[msg.sender].numPayments++;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        require(balanceReceived[msg.sender].totalBalance>=_amount, 'Not sufficient funds');
        balanceReceived[msg.sender].totalBalance-=_amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public{
        balanceReceived[msg.sender].totalBalance =0;
        _to.transfer(balanceReceived[msg.sender].totalBalance);
    }
}