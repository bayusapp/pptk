// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Chop {

  address public owner;

  struct Chopper {
    uint id_chop;
    uint id_karung1;
    uint id_karung2;
    uint id_karung3;
    uint id_karung4;
    uint id_karung5;
    uint id_karung6;
    uint id_karung7;
    uint id_karung8;
    uint id_karung9;
    uint id_karung10;
  }

  Chopper[] public ListChop;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addChop(uint _karung1, uint _karung2, uint _karung3, uint _karung4, uint _karung5, uint _karung6, uint _karung7, uint _karung8, uint _karung9, uint _karung10) public onlyOwner() {
    ListChop.push(Chopper(counter, _karung1, _karung2, _karung3, _karung4, _karung5, _karung6, _karung7, _karung8, _karung9, _karung10));
    counter++;
  }

  function updateChop(uint _id, uint _karung1, uint _karung2, uint _karung3, uint _karung4, uint _karung5, uint _karung6, uint _karung7, uint _karung8, uint _karung9, uint _karung10) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListChop[i].id_chop == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Chop tidak ditemukan");

    ListChop[_id].id_karung1  = _karung1;
    ListChop[_id].id_karung2  = _karung2;
    ListChop[_id].id_karung3  = _karung3;
    ListChop[_id].id_karung4  = _karung4;
    ListChop[_id].id_karung5  = _karung5;
    ListChop[_id].id_karung6  = _karung6;
    ListChop[_id].id_karung7  = _karung7;
    ListChop[_id].id_karung8  = _karung8;
    ListChop[_id].id_karung9  = _karung9;
    ListChop[_id].id_karung10 = _karung10;
  }

  function getAllChop() public view returns (Chopper[] memory) {
    return ListChop;
  }

  function getDataChop(uint _idChop) public view returns (uint _id, uint _karung1, uint _karung2, uint _karung3, uint _karung4, uint _karung5, uint _karung6, uint _karung7, uint _karung8, uint _karung9, uint _karung10) {
    require(_id < ListChop.length, "ID diluar jangkauan");
    Chopper memory chopper = ListChop[_idChop];
    return (chopper.id_chop, chopper.id_karung1, chopper.id_karung2, chopper.id_karung3, chopper.id_karung4, chopper.id_karung5, chopper.id_karung6, chopper.id_karung7, chopper.id_karung8, chopper.id_karung9, chopper.id_karung10);
  }

  function getCountChop() public view returns (uint) {
    return ListChop.length;
  }
}