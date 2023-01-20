// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Can't have state variables
// Can't send ETH
// All functions are internal
library PriceConverter {
    function getPrice() internal view returns(uint256) {
        // ABI:
        // Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        // ETH price in terms of USD
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // 1**10
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}