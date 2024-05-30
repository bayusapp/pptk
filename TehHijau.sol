// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TehHijau {

  address public owner;

  struct Teh {
    uint id_teh_hijau;
    string tanggal_pengemasan;
    string tanggal_expired;
    string tanggal_distribusi;
  }

  Teh[] public ListTehHijau;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addTehHijau(string memory _pengemasan, string memory _expired, string memory _distribusi) public onlyOwner() {
    require(bytes(_pengemasan).length > 0, "Tanggal Pengemasan tidak boleh kosong");
    require(bytes(_expired).length > 0, "Tanggal Expired tidak boleh kosong");
    require(bytes(_distribusi).length > 0, "Tanggal Distribusi tidak boleh kosong");

    ListTehHijau.push(Teh(counter, _pengemasan, _expired, _distribusi));
    counter++;
  }

  function updateTehHijau(uint _id, string memory _pengemasan, string memory _expired, string memory _distribusi) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListTehHijau[i].id_teh_hijau == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Teh Hijau tidak ditemukan");
    require(bytes(_pengemasan).length > 0, "Tanggal Pengemasan tidak boleh kosong");
    require(bytes(_expired).length > 0, "Tanggal Expired tidak boleh kosong");
    require(bytes(_distribusi).length > 0, "Tanggal Distribusi tidak boleh kosong");

    ListTehHijau[_id].tanggal_pengemasan  = _pengemasan;
    ListTehHijau[_id].tanggal_expired     = _expired;
    ListTehHijau[_id].tanggal_distribusi  = _distribusi;
  }

  function getAllTehHijau() public view returns (Teh[] memory) {
    return ListTehHijau;
  }

  function getDataTehHijau(uint _id_teh) public view returns (uint _id, string memory _pengemasan, string memory _expired, string memory _distribusi) {
    require(_id < ListTehHijau.length, "ID diluar jangkauan");
    Teh memory teh = ListTehHijau[_id_teh];
    return (teh.id_teh_hijau, teh.tanggal_pengemasan, teh.tanggal_expired, teh.tanggal_distribusi);
  }

  function getCountTehHijau() public view returns (uint) {
    return ListTehHijau.length;
  }
}