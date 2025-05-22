// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulScanner - Contract for scanning and verifying soul attributes within FinalSkyportDivineGuardian
/// @notice Provides interfaces to validate spiritual credentials and integrity checks.

contract SoulScanner {
    mapping(address => bool) private verifiedSouls;

    event SoulVerified(address indexed soul);
    event SoulRevoked(address indexed soul);

    /// @notice Verify a soul address
    /// @param soul Address to verify
    function verifySoul(address soul) external {
        verifiedSouls[soul] = true;
        emit SoulVerified(soul);
    }

    /// @notice Revoke verification of a soul address
    /// @param soul Address to revoke
    function revokeSoul(address soul) external {
        verifiedSouls[soul] = false;
        emit SoulRevoked(soul);
    }

    /// @notice Check if a soul is verified
    /// @param soul Address to check
    /// @return True if verified, false otherwise
    function isVerified(address soul) external view returns (bool) {
        return verifiedSouls[soul];
    }
}
