# Perancangan SmartContract Pusat Penelitian Teh dan Kina Gambung

## Requirement
- [Visual Studio Code](https://code.visualstudio.com/download) (text editor)
- [Node.js](https://nodejs.org/en)
- [Remix Editor Online](https://remix.ethereum.org/)
- [Remix IDE](https://github.com/ethereum/remix-desktop/releases) (optional)
- [Ganache](https://archive.trufflesuite.com/ganache/) (optional)

## Command untuk install Remix dengan npm
```sh
npm i @remix-project/remixd
```

## Command untuk koneksi localhost workspace SmartContract ke Remix
- Windows
```sh
node .\node_modules\@remix-project\remixd\src\bin\remixd.js
```
- Mac
```sh
node node_modules/@remix-project/remixd/src/bin/remixd.js
```

## Versi minimum untuk compiler Solidity
Versi 0.8.0 atau lebih tinggi

## Syntax in Solidity
```sh
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
```

## Cara mengatasi Remix IDE white screen
```sh
fetch('https://remix.ethereum.org/assets/version.json', { cache: "no-store" }).then(response => {
  response.text().then(function (data) {
    const version = JSON.parse(data);
    console.log(`Loading Remix ${version.version}`);
    createScriptTag(`polyfills.${version.version}.${version.timestamp}.js`, 'module');
    if (version.mode === 'development') {
      createScriptTag(`vendor.${version.version}.${version.timestamp}.js`, 'module');
      createScriptTag(`runtime.${version.version}.${version.timestamp}.js`, 'module');
    }
    createScriptTag(`main.${version.version}.${version.timestamp}.js`, 'text/javascript');
  });
});
```
- Buka Remix IDE
- Untuk Windows tekan CTRL + SHIFT + I untuk membuka console dan untuk Mac tekan command + option + I
- Pilih tab console
- Copy script diatas dan paste ke console

## Command untuk update node_modules Remix
npm update