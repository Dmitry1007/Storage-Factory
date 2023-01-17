// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    uint256 minimumUsd = 50;

    function fund() public payable {
        // msg is a global variable
        require(msg.value > 1e18, "Not enough bro");
    }
}