// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PackingUnsort {

  address public owner;

  struct PU {
    uint id_pack_unsort;
    string tanggal_packing;
    string tanggal_sorting;
    uint id_chop;
  }

  PU[] public ListPU;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addPU(string memory _packing, string memory _sorting, uint _id_chop) public onlyOwner() {
    require(bytes(_packing).length > 0, "Tanggal Packing tidak boleh kosong");
    require(bytes(_sorting).length > 0, "Tanggal Sorting tidak boleh kosong");

    ListPU.push(PU(counter, _packing, _sorting, _id_chop));
    counter++;
  }

  function updatePU(uint _id, string memory _packing, string memory _sorting, uint _id_chop) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListPU[i].id_pack_unsort == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Packing Unsort tidak ditemukan");
    require(bytes(_packing).length > 0, "Tanggal Packing tidak boleh kosong");
    require(bytes(_sorting).length > 0, "Tanggal Sorting tidak boleh kosong");

    ListPU[_id].tanggal_packing = _packing;
    ListPU[_id].tanggal_sorting = _sorting;
    ListPU[_id].id_chop         = _id_chop;
  }

  function getAllPackingUnsort() public view returns (PU[] memory) {
    return ListPU;
  }

  function getDataPackingUnsort(uint _idPU) public view returns (uint _id, string memory _packing, string memory _sorting, uint _id_chop) {
    require(_id < ListPU.length, "ID diluar jangkauan");
    PU memory pu = ListPU[_idPU];
    return (pu.id_pack_unsort, pu.tanggal_packing, pu.tanggal_sorting, pu.id_chop);
  }

  function getCountPackingUnsort() public view returns (uint) {
    return ListPU.length;
  }
}