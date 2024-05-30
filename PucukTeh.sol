// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PucukTeh {

  address owner;

  struct Pucuk {
    uint id_teh;
    string koordinat_kebun;
    string varietas_teh;
    uint jumlah_setor;
    uint id_petani;
  }

  Pucuk[] public ListPucukTeh;
  uint public counter;

  modifier onlyOwner() {
    require(msg.sender == owner, "Hanya owner yang dapat menggunakan");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function addPucukTeh(string memory _koordinat, string memory _varietas, uint _jumlah, uint _id_petani) public onlyOwner() {
    require(bytes(_koordinat).length > 0, "Koordinat Kebun tidak boleh kosong");
    require(bytes(_varietas).length > 0, "varietas Teh tidak boleh kosong");
    require(_jumlah < 0, "Jumlah Setor tidak boleh kosong");
    require(_id_petani < 0, "ID Petani tidak boleh kosong");

    ListPucukTeh.push(Pucuk(counter, _koordinat, _varietas, _jumlah, _id_petani));
  }

  function updatePucukTeh(uint _id, string memory _koordinat, string memory _varietas, uint _jumlah, uint _id_petani) public onlyOwner() {
    bool find = false;
    for (uint i = 0; i < counter; i++) {
      if (ListPucukTeh[i].id_teh == _id) {
        find = true;
        break;
      }
    }

    require(find, "ID Teh tidak ditemukan");
    require(bytes(_koordinat).length > 0, "Koordinat Kebun tidak boleh kosong");
    require(bytes(_varietas).length > 0, "varietas Teh tidak boleh kosong");
    require(_jumlah < 0, "Jumlah Setor tidak boleh kosong");
    require(_id_petani < 0, "ID Petani tidak boleh kosong");

    ListPucukTeh[_id].koordinat_kebun = _koordinat;
    ListPucukTeh[_id].varietas_teh = _varietas;
    ListPucukTeh[_id].jumlah_setor = _jumlah;
  }

  function getAllPucukTeh() public view returns (Pucuk[] memory) {
    return ListPucukTeh;
  }

  function getDataPucukTeh(uint _idPucuk) public view returns (uint _id,string memory _koordinat, string memory _varietas, uint _jumlah, uint _id_petani) {
    require(_id < ListPucukTeh.length, "ID diluar jangkauan");
    Pucuk memory pucuk = ListPucukTeh[_idPucuk];
    return (pucuk.id_teh, pucuk.koordinat_kebun, pucuk.varietas_teh, pucuk.jumlah_setor, pucuk.id_petani);
  }

  function getCountPucukTeh() public view returns (uint) {
    return ListPucukTeh.length;
  }
  
}