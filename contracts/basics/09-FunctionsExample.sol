//SPDX-License-Identifier:MIT
pragma solidity^0.8.1;
contract FunctionsExample{
    mapping(address=> uint) public balanceReceived;
    address payable owner;

    constructor(){
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function convertWeitoEther(uint amountinWei) public pure returns(uint){
        return amountinWei/1 ether;
    }

    function destroySmartContract() public{
        require(msg.sender==owner,'You are not the owner');
        selfdestruct(owner);
    }

    function receiveMoney() public payable{
        assert(balanceReceived[msg.sender]+uint(msg.value)>=balanceReceived[msg.sender]);
        balanceReceived[msg.sender]+=uint(msg.value);
    }

    function withdrawMoney(address payable _to, uint _amount) public{
       require(_amount<=balanceReceived[msg.sender],'You dont have enough funds');
       assert(balanceReceived[msg.sender]>=balanceReceived[msg.sender]-_amount);
       balanceReceived[msg.sender] -= _amount;
       _to.transfer(_amount);
    }

    function fall() external payable{
        receiveMoney();
    }
}