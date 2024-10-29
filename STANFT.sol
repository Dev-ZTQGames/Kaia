// 0x468078aC2E46412Ea8b690e8135008Ebd58fd4ab

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@klaytn/contracts@1.0.6/KIP/token/KIP17/KIP17.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP17/extensions/KIP17Enumerable.sol";
import "@klaytn/contracts@1.0.6/security/Pausable.sol";
import "@klaytn/contracts@1.0.6/access/Ownable.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP17/extensions/KIP17Burnable.sol";
import "@klaytn/contracts@1.0.6/utils/Counters.sol";

/// @custom:security-contact neoguru@ztqholding.com
contract SaveTheAnimalNFT is KIP17, KIP17Enumerable, Pausable, Ownable, KIP17Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() KIP17("Save The Animal NFT", "STANFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://cdn.nebula3gamefi.com/nft/sta";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(KIP17, KIP17Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(KIP17, KIP17Enumerable, KIP17Burnable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

