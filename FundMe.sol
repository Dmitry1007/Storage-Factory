// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // msg is a global variable
        // Must be greater than 1 ETH
        // 18 decimals
        require(msg.value.getConversionRate() >= minimumUsd, "Not enough bro");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }
}