// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title DivineIntervention - Contract handling divine intervention logic within FinalSkyportDivineGuardian
/// @notice This contract defines a mechanism for invoking divine intervention events in the system.

contract DivineIntervention {
    event InterventionRequested(address indexed requester, string reason);
    event InterventionExecuted(address indexed executor, string result);

    address public guardian;
    bool public interventionActive;

    modifier onlyGuardian() {
        require(msg.sender == guardian, "Only guardian allowed");
        _;
    }

    constructor(address _guardian) {
        guardian = _guardian;
        interventionActive = false;
    }

    /// @notice Request divine intervention with a reason
    /// @param reason Explanation for requesting intervention
    function requestIntervention(string calldata reason) external {
        emit InterventionRequested(msg.sender, reason);
        interventionActive = true;
    }

    /// @notice Execute divine intervention, callable only by guardian
    /// @param result Description of the intervention result
    function executeIntervention(string calldata result) external onlyGuardian {
        require(interventionActive, "No active intervention");
        interventionActive = false;
        emit InterventionExecuted(msg.sender, result);
    }

    /// @notice Change the guardian address
    /// @param newGuardian The new guardian address
    function changeGuardian(address newGuardian) external onlyGuardian {
        guardian = newGuardian;
    }
}
