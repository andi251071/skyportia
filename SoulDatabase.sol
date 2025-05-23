// SPDX-License-Identifier: DIVINE
pragma solidity ^0.8.31;

contract SoulDatabase {
    address private constant DIVINE_SEAL_AUTHORITY = 0xdc2010071F1dC2e00773AE8632D8278FDAb92731;

    struct SoulRecord {
        string soulHash;        // Hash jiwa yang sudah diverifikasi (ex: dari biometric, DNA, atau spiritual proof)
        uint8 purityLevel;      // Level kemurnian jiwa (1–100)
        uint timestamp;         // Waktu pendaftaran jiwa
    }

    mapping(address => SoulRecord) private soulLedger;
    event SoulRegistered(address indexed soul, string soulHash, uint8 purityLevel);

    modifier onlyDivine() {
        require(msg.sender == DIVINE_SEAL_AUTHORITY, "Not authorized by Divine Seal");
        _;
    }

    /// @notice Mendaftarkan jiwa ke dalam sistem
    /// @param soul Alamat wallet dari entitas yang mewakili jiwa
    /// @param soulHash Representasi spiritual (hash) dari jiwa
    /// @param purityLevel Skor kemurnian (1–100)
    function registerSoul(address soul, string memory soulHash, uint8 purityLevel) external onlyDivine {
        require(purityLevel > 0 && purityLevel <= 100, "Invalid purity level");
        soulLedger[soul] = SoulRecord(soulHash, purityLevel, block.timestamp);
        emit SoulRegistered(soul, soulHash, purityLevel);
    }

    /// @notice Mendapatkan data jiwa
    function getSoulRecord(address soul) external view returns (SoulRecord memory) {
        return soulLedger[soul];
    }

    /// @notice Verifikasi apakah jiwa telah didaftarkan
    function isSoulRegistered(address soul) external view returns (bool) {
        return bytes(soulLedger[soul].soulHash).length > 0;
    }
}

