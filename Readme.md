# Discussion Rewards DApp

## Project Title

**Discussion Rewards DApp**

## Project Description

The **Discussion Rewards DApp** is a decentralized application (DApp) built on blockchain technology that allows users to participate in online group discussions and earn cryptocurrency rewards for their contributions. The application leverages Ethereum-based smart contracts (using **ERC-20 tokens**) to facilitate rewarding users for active participation in discussions. This system helps incentivize thoughtful engagement in discussions, which could be applied to various online communities, forums, and educational platforms.

The application uses two main contracts:
1. **DiscussionToken (ERC-20)**: A custom ERC-20 token used as a reward for participants in discussions.
2. **DiscussionReward**: Manages the creation of discussions, participant registration, and the rewarding process.

Participants join a discussion, engage, and receive rewards in the form of **DiscussionToken** when the discussion ends.

## Contract Address

 DiscussionTokenAddress = 0x037FE75b03dA07CDa20fC7C020964880D196C62B
 DiscussionRewardAddress = 0xe87605D5BcD55a2cb348B4fc815F243e55A7A4A2

## Project Vision

The vision of the **Discussion Rewards DApp** is to create a decentralized ecosystem where users can participate in valuable discussions and be rewarded for their contributions. By leveraging blockchain technology, the project ensures transparency, immutability, and fairness in the reward distribution process. The long-term goal is to integrate this system into online platforms, where users can discuss topics, exchange knowledge, and be compensated based on their engagement and the value they provide to the community.

## Key Features

- **ERC-20 Token Rewards**: Users are rewarded with **DiscussionToken** (an ERC-20 token) for participating in group discussions.
  
- **Transparent Reward System**: The reward distribution is transparent and based on blockchain technology. All transactions and rewards are verifiable on the blockchain.

- **Discussion Creation**: Only the contract owner can create discussions. Each discussion has a set reward amount for participants.

- **Join Discussions**: Users can join active discussions by calling the `joinDiscussion()` function. Participants are tracked for reward distribution.

- **End Discussion & Reward Participants**: The discussion organizer (owner) can call the `endDiscussion()` function to distribute tokens to all participants.

- **Easy Integration**: The system can be integrated into various platforms such as educational websites, forums, or community-driven projects.

- **Gas Efficiency**: The token and reward distribution system is designed to minimize gas fees and ensure efficient interaction with the blockchain.
