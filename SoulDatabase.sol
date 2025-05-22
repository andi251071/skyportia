// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulDatabase - Contract managing soul data storage within FinalSkyportDivineGuardian
/// @notice Stores and manages soul-related data and metadata securely.

contract SoulDatabase {
    struct Soul {
        string name;
        uint256 creationTimestamp;
        string metadataURI;
    }

    mapping(address => Soul) private souls;

    event SoulRegistered(address indexed soulAddress, string name, string metadataURI);
    event SoulUpdated(address indexed soulAddress, string name, string metadataURI);

    /// @notice Register a new soul with details
    /// @param soulAddress Address representing the soul
    /// @param name Name of the soul
    /// @param metadataURI URI pointing to soul metadata
    function registerSoul(address soulAddress, string calldata name, string calldata metadataURI) external {
        require(bytes(souls[soulAddress].name).length == 0, "Soul already registered");
        souls[soulAddress] = Soul(name, block.timestamp, metadataURI);
        emit SoulRegistered(soulAddress, name, metadataURI);
    }

    /// @notice Update an existing soul's data
    /// @param soulAddress Address representing the soul
    /// @param name New name of the soul
    /// @param metadataURI New URI pointing to soul metadata
    function updateSoul(address soulAddress, string calldata name, string calldata metadataURI) external {
        require(bytes(souls[soulAddress].name).length != 0, "Soul not registered");
        souls[soulAddress].name = name;
        souls[soulAddress].metadataURI = metadataURI;
        emit SoulUpdated(soulAddress, name, metadataURI);
    }

    /// @notice Get soul data by address
    /// @param soulAddress Address representing the soul
    /// @return name Name of the soul
    /// @return creationTimestamp Timestamp when soul was registered
    /// @return metadataURI Metadata URI of the soul
    function getSoul(address soulAddress) external view returns (string memory name, uint256 creationTimestamp, string memory metadataURI) {
        Soul memory s = souls[soulAddress];
        return (s.name, s.creationTimestamp, s.metadataURI);
    }
}
