// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Pengarungan {

  address public owner;

  struct Karung {
    uint id_karung;
    string tanggal_pengarungan;
    uint id_proses;
  }

  Karung[] public ListKarung;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addKarung(string memory _tanggal, uint _id_proses) public onlyOwner() {
    require(bytes(_tanggal).length > 0, "Tanggal Pengarungan tidak boleh kosong");
    require(_id_proses < 0, "ID Proses tidak boleh kosong");

    ListKarung.push(Karung(counter, _tanggal, _id_proses));
    counter++;
  }

  function updateKarung(uint _id, string memory _tanggal, uint _id_proses) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListKarung[i].id_proses == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Karung tidak ditemukan");
    require(bytes(_tanggal).length > 0, "Tanggal Pengarungan tidak boleh kosong");
    require(_id_proses < 0, "ID Proses tidak boleh kosong");

    ListKarung[_id].tanggal_pengarungan = _tanggal;
    ListKarung[_id].id_proses           = _id_proses;
  }

  function getAllKarung() public view returns (Karung[] memory) {
    return ListKarung;
  }

  function getDataKarung(uint _idKarung) public view returns (uint _id, string memory _tanggal, uint _id_proses) {
    require(_id < ListKarung.length, "ID diluar jangkauan");
    Karung memory karung = ListKarung[_idKarung];
    return (karung.id_karung, karung.tanggal_pengarungan, karung.id_proses);
  }

  function getCountKarung() public view returns (uint) {
    return ListKarung.length;
  }
}