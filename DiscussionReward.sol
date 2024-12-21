// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DiscussionReward {
    address public owner;
    IERC20 public rewardToken;

    // Struct to track discussions
    struct Discussion {
        uint256 id;
        string topic;
        uint256 rewardPerParticipant;
        bool isActive;
        mapping(address => bool) participants;
        address[] participantList;
    }

    uint256 public discussionCounter;
    mapping(uint256 => Discussion) public discussions;

    event DiscussionCreated(uint256 discussionId, string topic, uint256 rewardPerParticipant);
    event UserJoined(uint256 discussionId, address participant);
    event UserRewarded(uint256 discussionId, address participant, uint256 rewardAmount);
    event DiscussionEnded(uint256 discussionId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can execute this");
        _;
    }

    constructor(address tokenAddress) {
        owner = msg.sender;
        rewardToken = IERC20(tokenAddress);
    }

    // Create a new discussion
    function createDiscussion(string memory _topic, uint256 _rewardPerParticipant) public onlyOwner {
        discussionCounter++;
        discussions[discussionCounter].id = discussionCounter;
        discussions[discussionCounter].topic = _topic;
        discussions[discussionCounter].rewardPerParticipant = _rewardPerParticipant;
        discussions[discussionCounter].isActive = true;

        emit DiscussionCreated(discussionCounter, _topic, _rewardPerParticipant);
    }

    // Join a discussion
    function joinDiscussion(uint256 discussionId) public {
        require(discussions[discussionId].isActive, "Discussion is not active");
        require(!discussions[discussionId].participants[msg.sender], "You have already joined this discussion");

        discussions[discussionId].participants[msg.sender] = true;
        discussions[discussionId].participantList.push(msg.sender);

        emit UserJoined(discussionId, msg.sender);
    }

    // End a discussion and reward participants
    function endDiscussion(uint256 discussionId) public onlyOwner {
        require(discussions[discussionId].isActive, "Discussion is already ended");

        uint256 rewardAmount = discussions[discussionId].rewardPerParticipant;
        for (uint256 i = 0; i < discussions[discussionId].participantList.length; i++) {
            address participant = discussions[discussionId].participantList[i];
            rewardToken.transfer(participant, rewardAmount);

            emit UserRewarded(discussionId, participant, rewardAmount);
        }

        discussions[discussionId].isActive = false;
        emit DiscussionEnded(discussionId);
    }

    // Get the list of participants in a discussion
    function getParticipants(uint256 discussionId) public view returns (address[] memory) {
        return discussions[discussionId].participantList;
    }
}
