// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title DivineFortress - Main security fortress contract for FinalSkyportDivineGuardian system
/// @notice Implements layered security, guardian roles, and emergency protocols.

contract DivineFortress {
    address public owner;
    mapping(address => bool) public guardians;
    bool public emergencyLock;

    event GuardianAdded(address indexed guardian);
    event GuardianRemoved(address indexed guardian);
    event EmergencyLockActivated();
    event EmergencyLockDeactivated();

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier onlyGuardian() {
        require(guardians[msg.sender], "Only guardian");
        _;
    }

    modifier notEmergency() {
        require(!emergencyLock, "Emergency lock active");
        _;
    }

    constructor() {
        owner = msg.sender;
        guardians[msg.sender] = true;
        emergencyLock = false;
    }

    /// @notice Add a guardian
    /// @param guardian Address to add as guardian
    function addGuardian(address guardian) external onlyOwner {
        guardians[guardian] = true;
        emit GuardianAdded(guardian);
    }

    /// @notice Remove a guardian
    /// @param guardian Address to remove
    function removeGuardian(address guardian) external onlyOwner {
        guardians[guardian] = false;
        emit GuardianRemoved(guardian);
    }

    /// @notice Activate emergency lock
    function activateEmergencyLock() external onlyGuardian {
        emergencyLock = true;
        emit EmergencyLockActivated();
    }

    /// @notice Deactivate emergency lock
    function deactivateEmergencyLock() external onlyOwner {
        emergencyLock = false;
        emit EmergencyLockDeactivated();
    }

    /// @notice Transfer ownership to a new address
    /// @param newOwner New owner address
    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
