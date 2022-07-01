// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./node_modules/@klaytn/contracts/KIP/token/KIP17/KIP17.sol";
import "./node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17Burnable.sol";
import "./node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17Enumerable.sol";
import "./node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17MetadataMintable.sol";
import "./node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17Mintable.sol";
import "./node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17Pausable.sol";


contract CLM1 is KIP17, KIP17MetadataMintable, KIP17Enumerable, KIP17Burnable, KIP17Pausable {
    constructor (string memory name, string memory symbol, string memory uri) KIP17(name, symbol) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        addPauser(msg.sender);
        addMinter(msg.sender);
        setContractURI(uri);
    }

    string private _contractURI;
    function setContractURI(string memory uri) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _contractURI = uri;
    }
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(KIP17, KIP17Enumerable, KIP17Pausable) {
        KIP17Enumerable._beforeTokenTransfer(from, to, tokenId);
        KIP17Pausable._beforeTokenTransfer(from, to, tokenId);
    }
    function _burn(uint256 tokenId) internal virtual override(KIP17, KIP17URIStorage) {
        KIP17URIStorage._burn(tokenId);
    }
    function supportsInterface(bytes4 interfaceId)
        public view virtual override(KIP17, KIP17Burnable, KIP17Enumerable, KIP17MetadataMintable, KIP17Pausable) returns (bool) {
        return
            KIP17.supportsInterface(interfaceId) ||
            KIP17Burnable.supportsInterface(interfaceId) ||
            KIP17Enumerable.supportsInterface(interfaceId) ||
            KIP17MetadataMintable.supportsInterface(interfaceId) ||
            KIP17Pausable.supportsInterface(interfaceId);
    }
    function tokenURI(uint256 tokenId) public view virtual override(KIP17, KIP17URIStorage) returns (string memory) {
        return KIP17URIStorage.tokenURI(tokenId);
    }
}
