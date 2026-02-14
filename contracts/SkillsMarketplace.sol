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
    uint256 public gigCounter;

    constructor() {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
     struct Worker {
        string skill;
        bool isRegistered;
    }
    
    struct Gig {
        address employer;
        string description;
        string skillRequired;
        uint256 bounty;
        bool isOpen;
        bool isCompleted;
        address selectedWorker;
    function postGig(string memory description, string memory skillRequired) public payable {
        // Your implementation here
    function postGig(string memory description, string memory skillRequired) public payable {
        require(msg.value > 0, "Bounty required");
        require(bytes(description).length > 0, "Description required");
        require(bytes(skillRequired).length > 0, "Skill required");

        gigs[gigCounter] = Gig({
            employer: msg.sender,
            description: description,
            skillRequired: skillRequired,
            bounty: msg.value,
            isOpen: true,
            isCompleted: false,
            selectedWorker: address(0)
        });

        emit GigPosted(gigCounter, msg.sender, msg.value);
        gigCounter++;
    
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

     function applyForGig(uint256 gigId) public {
        require(workers[msg.sender].isRegistered, "Not registered");
        require(gigs[gigId].isOpen, "Gig not open");
        require(!hasApplied[gigId][msg.sender], "Already applied");
        require(
            keccak256(bytes(workers[msg.sender].skill)) ==
            keccak256(bytes(gigs[gigId].skillRequired)),
            "Skill mismatch"
        );

        hasApplied[gigId][msg.sender] = true;

        em
    }
    
    // TODO: Implement submitWork function
    // Requirements:
    // - Workers submit completed work (with proof/URL)
    // - Validate that worker applied for this gig
    // - Update gig status
    // - Emit an event
    function submitWork(uint256 gigId, string memory submissionUrl) public {
        // Your implementation here

    function submitWork(uint256 gigId, string memory submissionUrl) public {
        require(hasApplied[gigId][msg.sender], "Did not apply");
        require(gigs[gigId].isOpen, "Gig not open");
        require(bytes(submissionUrl).length > 0, "Submission required");
        submissions[gigId][msg.sender] = submissionUrl;
        gigs[gigId].selectedWorker = msg.sender;

        emit WorkSubmitted(gigId, msg.sender, submissionUrl);
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
         function approveAndPay(uint256 gigId, address worker) public {
        Gig storage gig = gigs[gigId];

        require(msg.sender == gig.employer, "Not employer");
        require(gig.isOpen, "Gig closed");
        require(!gig.isCompleted, "Already completed");
        require(gig.selectedWorker == worker, "Worker not selected");
        require(hasApplied[gigId][worker], "Worker did not apply");

        uint256 amount = gig.bounty;
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
