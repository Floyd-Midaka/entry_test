// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title SkillsMarketplace
 * @dev A decentralised marketplace for skills and gigs
 * @notice PART 1 - Skills Marketplace (MANDATORY)
 */
contract SkillsMarketplace {
    
    // TODO: Define your state variables here
    // Consider:
    // - How will you track workers and their skills?
    // - How will you store gig information?
    // - How will you manage payments?
    
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    // TODO: Implement registerWorker function
    // Requirements:
    // - Workers should be able to register with their skill
    // - Prevent duplicate registrations
    // - Emit an event when a worker registers
    function registerWorker(string memory skill) public {
        // Your implementation here
    }
    
    // TODO: Implement postGig function
    // Requirements:
    // - Employers post gigs with bounty (msg.value)
    // - Store gig description and required skill
    // - Ensure ETH is sent with the transaction
    // - Emit an event when gig is posted
    function postGig(string memory description, string memory skillRequired) public payable {
        // Your implementation here
        // Think: How do you safely hold the ETH until work is approved?
    }
    
    // TODO: Implement applyForGig function
    // Requirements:
    // - Workers can apply for gigs
    // - Check if worker has the required skill
    // - Prevent duplicate applications
    // - Emit an event
    function applyForGig(uint256 gigId) public {
        // Your implementation here
    }
    
    // TODO: Implement submitWork function
    // Requirements:
    // - Workers submit completed work (with proof/URL)
    // - Validate that worker applied for this gig
    // - Update gig status
    // - Emit an event
    function submitWork(uint256 gigId, string memory submissionUrl) public {
        // Your implementation here
    }
    
    // TODO: Implement approveAndPay function
    // Requirements:
    // - Only employer who posted gig can approve
    // - Transfer payment to worker
    // - CRITICAL: Implement reentrancy protection
    // - Update gig status to completed
    // - Emit an event
    function approveAndPay(uint256 gigId, address worker) public {
        // Your implementation here
        // Security: Use checks-effects-interactions pattern!
    }
    
    // BONUS: Implement dispute resolution
    // What happens if employer doesn't approve but work is done?
    // Consider implementing a timeout mechanism
    
    // Helper functions you might need:
    // - Function to get gig details
    // - Function to check worker registration
    // - Function to get all gigs
}

