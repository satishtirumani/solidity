//SPDX-License-Identifier:MIT
pragma solidity^0.8.1;
contract SimpleMappingsExample{
    mapping(uint=>bool) public myMapping;
    mapping(address=>bool) public myAddressMapping;

    mapping (uint => mapping(uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public{
        myMapping[_index]=true;
    }

    function setMyAddresstoTrue() public{
        myAddressMapping[msg.sender] = true;
    }

     function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns (bool) {
        return uintUintBoolMapping[_index1][_index2];
    }
}