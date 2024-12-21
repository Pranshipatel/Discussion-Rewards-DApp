// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DiscussionToken is ERC20 {
    constructor() ERC20("DiscussionToken", "DT") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1 million tokens to the deployer's address
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount); // Function to mint tokens for rewards
    }
}
