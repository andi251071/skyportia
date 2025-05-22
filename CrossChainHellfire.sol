// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title CrossChainHellfire - Contract managing cross-chain firewalls and security in FinalSkyportDivineGuardian
/// @notice Handles cross-chain validations and protection mechanisms to guard against malicious interactions.

contract CrossChainHellfire {
    mapping(bytes32 => bool) private approvedChains;

    event ChainApproved(bytes32 indexed chainId);
    event ChainRevoked(bytes32 indexed chainId);

    /// @notice Approve a chain ID for cross-chain communication
    /// @param chainId The unique identifier of the chain
    function approveChain(bytes32 chainId) external {
        approvedChains[chainId] = true;
        emit ChainApproved(chainId);
    }

    /// @notice Revoke a chain ID
    /// @param chainId The unique identifier of the chain
    function revokeChain(bytes32 chainId) external {
        approvedChains[chainId] = false;
        emit ChainRevoked(chainId);
    }

    /// @notice Check if a chain ID is approved
    /// @param chainId The unique identifier of the chain
    /// @return True if approved, false otherwise
    function isApprovedChain(bytes32 chainId) external view returns (bool) {
        return approvedChains[chainId];
    }
}
