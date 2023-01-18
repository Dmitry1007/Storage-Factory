// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 minimumUsd = 50;

    function fund() public payable {
        // msg is a global variable
        // Must be greater than 1 ETH
        // 18 decimals
        require(msg.value > 1e18, "Not enough bro");
    }

    function getPrice() public view returns(uint256) {
        // ABI:
        // Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        // ETH price in terms of USD
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // 1**10
    }
}