//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
contract SimpleVariables{
    uint256 public myInt;
    
    function setMyInt(uint _myInt) public{
        myInt = _myInt;
    }
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function incrementInt() public{
        myInt++;
    }

    function decrementInt() public{
        myInt--;
    }

    address public myAddress;

    function setMyAddress(address _myAddress) public{
        myAddress = _myAddress;
    }

    function getBalanceOfAddress() public view returns(uint){
        return myAddress.balance;
    }

    string public myString;
    
    function setMyString(string memory _myString) public{
        myString = _myString;
    }

} 