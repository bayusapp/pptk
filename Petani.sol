// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Petani {

  address public owner;

  struct Ptn {
    uint id_petani;
    string nama_petani;
    string alamat_petani;
    string kategori_petani;
  }

  Ptn[] public ListPetani;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addPetani(string memory _nama, string memory _alamat, string memory _kategori) public onlyOwner() {
    require(bytes(_nama).length > 0, "Nama Petani tidak boleh kosong");
    require(bytes(_alamat).length > 0, "Alamat Petani tidak boleh kosong");
    require(bytes(_kategori).length > 0, "Kategori Petani tidak boleh kosong");

    ListPetani.push(Ptn(counter, _nama, _alamat, _kategori));
    counter++;
  }

  function updatePetani(uint _id, string memory _nama, string memory _alamat, string memory _kategori) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListPetani[i].id_petani == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Petani tidak ditemukan");
    require(bytes(_nama).length > 0, "Nama Petani tidak boleh kosong");
    require(bytes(_alamat).length > 0, "Alamat Petani tidak boleh kosong");
    require(bytes(_kategori).length > 0, "Kategori Petani tidak boleh kosong");

    ListPetani[_id].nama_petani     = _nama;
    ListPetani[_id].alamat_petani   = _alamat;
    ListPetani[_id].kategori_petani = _kategori;
  }

  function getAllPetani() public view returns (Ptn[] memory) {
    return ListPetani;
  }

  function getDataPetani(uint _idPetani) public view returns (uint _id, string memory _nama, string memory _alamat, string memory _kategori) {
    require(_id < ListPetani.length, "ID diluar jangkauan");
    Ptn memory ptn = ListPetani[_idPetani];
    return (ptn.id_petani, ptn.nama_petani, ptn.alamat_petani, ptn.kategori_petani);
  }

  function getCountPetani() public view returns (uint) {
    return ListPetani.length;
  }
}