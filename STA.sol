// 0x7570b4e62070345ff8e5ef0c71f35c57714f2662

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@klaytn/contracts@1.0.6/KIP/token/KIP7/KIP7.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP7/extensions/KIP7Burnable.sol";
import "@klaytn/contracts@1.0.6/security/Pausable.sol";
import "@klaytn/contracts@1.0.6/access/Ownable.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP7/extensions/draft-KIP7Permit.sol";

contract SaveTheAnimal is KIP7, KIP7Burnable, Pausable, Ownable, KIP7Permit {
    constructor() KIP7("Save The Animal", "STA") KIP7Permit("Save The Animal") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(KIP7, KIP7Burnable)
        returns (bool)
    {
        return
            interfaceId == type(IKIP7Permit).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

