//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
contract SendMoneyExamples{
    uint public balanceReceived;
    uint public lockedUntil;
    function recieveMoney() public payable{
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public{
        if(lockedUntil<block.timestamp){
            address payable to = payable(msg.sender);
            to.transfer(this.getBalance());
        }
       
    }

    function sendMoney(address payable _to) public{
         if(lockedUntil<block.timestamp){
            _to.transfer(address(this).balance);
         }
    }
}