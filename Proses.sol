// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Proses {

  address public owner;

  struct Prs {
    uint id_proses;
    string tanggal_pelayunan;
    string tanggal_pendinginan;
    string tanggal_penggulungan;
    string tanggal_pengeringan1;
    string tanggal_pengeringan2;
  }

  Prs[] public ListProses;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addProses(string memory _pelayunan, string memory _pendinginan, string memory _penggulungan, string memory _pengeringan1, string memory _pengeringan2) public onlyOwner() {
    require(bytes(_pelayunan).length > 0, "Tanggal Pelayunan tidak boleh kosong");
    require(bytes(_pendinginan).length > 0, "Tanggal Pendinginan tidak boleh kosong");
    require(bytes(_penggulungan).length > 0, "Tanggal Penggulungan tidak boleh kosong");
    require(bytes(_pengeringan1).length > 0, "Tanggal Pengeringan 1 tidak boleh kosong");
    require(bytes(_pengeringan2).length > 0, "Tanggal Pengeringan 2 tidak boleh kosong");

    ListProses.push(Prs(counter, _pelayunan, _pendinginan, _penggulungan, _pengeringan1, _pengeringan2));
    counter++;
  }

  function updateProses(uint _id, string memory _pelayunan, string memory _pendinginan, string memory _penggulungan, string memory _pengeringan1, string memory _pengeringan2) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListProses[i].id_proses == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Proses tidak ditemukan");
    require(bytes(_pelayunan).length > 0, "Tanggal Pelayunan tidak boleh kosong");
    require(bytes(_pendinginan).length > 0, "Tanggal Pendinginan tidak boleh kosong");
    require(bytes(_penggulungan).length > 0, "Tanggal Penggulungan tidak boleh kosong");
    require(bytes(_pengeringan1).length > 0, "Tanggal Pengeringan 1 tidak boleh kosong");
    require(bytes(_pengeringan2).length > 0, "Tanggal Pengeringan 2 tidak boleh kosong");

    ListProses[_id].tanggal_pelayunan     = _pelayunan;
    ListProses[_id].tanggal_pendinginan   = _pendinginan;
    ListProses[_id].tanggal_penggulungan  = _penggulungan;
    ListProses[_id].tanggal_pengeringan1  = _pengeringan1;
    ListProses[_id].tanggal_pengeringan2  = _pengeringan2;
  }

  function getAllProses() public view returns (Prs[] memory) {
    return ListProses;
  }

  function getDataProses(uint _idProses) public view returns (uint _id, string memory _pelayunan, string memory _pendinginan, string memory _penggulungan, string memory _pengeringan1, string memory _pengeringan2) {
    require(_id < ListProses.length, "ID diluar jangkauan");
    Prs memory prs = ListProses[_idProses];
    return (prs.id_proses, prs.tanggal_pelayunan, prs.tanggal_pendinginan, prs.tanggal_penggulungan, prs.tanggal_pengeringan1, prs.tanggal_pengeringan2);
  }

  function getCountProses() public view returns (uint) {
    return ListProses.length;
  }
}