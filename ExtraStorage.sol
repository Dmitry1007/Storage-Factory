// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// Child contract of SimpleStorage that inherits all the functionality
contract ExtraStorage is SimpleStorage {
    // override store function
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 10;
    }
}