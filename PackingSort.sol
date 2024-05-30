// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PackingSort {

  address public owner;

  struct PS {
    uint id_pack_sort;
    string tanggal_packing;
    string tanggal_sorting;
    uint id_chop;
  }

  PS[] public ListPS;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addPS(string memory _packing, string memory _sorting, uint _id_chop) public onlyOwner() {
    require(bytes(_packing).length > 0, "Tanggal Packing tidak boleh kosong");
    require(bytes(_sorting).length > 0, "Tanggal Sorting tidak boleh kosong");

    ListPS.push(PS(counter, _packing, _sorting, _id_chop));
    counter++;
  }

  function updatePS(uint _id, string memory _packing, string memory _sorting, uint _id_chop) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListPS[i].id_pack_sort == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Packing Sort tidak ditemukan");
    require(bytes(_packing).length > 0, "Tanggal Packing tidak boleh kosong");
    require(bytes(_sorting).length > 0, "Tanggal Sorting tidak boleh kosong");

    ListPS[_id].tanggal_packing = _packing;
    ListPS[_id].tanggal_sorting = _sorting;
    ListPS[_id].id_chop         = _id_chop;
  }

  function getAllPackingSort() public view returns (PS[] memory) {
    return ListPS;
  }

  function getDataPackingSort(uint _idPS) public view returns (uint _id, string memory _packing, string memory _sorting, uint _id_chop) {
    require(_id < ListPS.length, "ID diluar jangkauan");
    PS memory ps = ListPS[_idPS];
    return (ps.id_pack_sort, ps.tanggal_packing, ps.tanggal_sorting, ps.id_chop);
  }

  function getCountPackingSort() public view returns (uint) {
    return ListPS.length;
  }
}