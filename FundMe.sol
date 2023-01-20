// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

error NotOwner();
contract FundMe {
    using PriceConverter for uint256;

    uint256 constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    address public immutable i_owner;

    // called immediately after deployment of this contract
    constructor() {
        // owner is whomever deploys this contract
        i_owner = msg.sender;
    }

    function fund() public payable {
        // msg is a global variable
        // Must be greater than 1 ETH
        // 18 decimals
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Not enough bro");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        
        // starting index, ending index, step amount
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset funders array
        funders = new address[](0);

        // call, mucho powerful, can call any contract within Ethereum
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }
    
    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner");
        // run the rest of the code, once the above statement comes back true
        // _;

        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }
}