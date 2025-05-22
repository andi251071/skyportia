// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PrayerTime - Contract to provide prayer times within FinalSkyportDivineGuardian system
/// @notice This contract offers a basic interface for fetching prayer times based on UTC timestamps.

contract PrayerTime {
    struct Prayer {
        string name;
        uint256 time; // Unix timestamp for prayer time
    }

    mapping(uint256 => Prayer[5]) private dailyPrayers; // Key: date as yyyymmdd, value: array of 5 prayer times

    event PrayerTimeSet(uint256 indexed date, string prayerName, uint256 time);

    /// @notice Set prayer time for a given date and prayer name
    /// @param date Date in yyyymmdd format
    /// @param prayerIndex Index of prayer (0 to 4)
    /// @param prayerName Name of the prayer
    /// @param time Unix timestamp of prayer time
    function setPrayerTime(
        uint256 date,
        uint8 prayerIndex,
        string calldata prayerName,
        uint256 time
    ) external {
        require(prayerIndex < 5, "Invalid prayer index");
        dailyPrayers[date][prayerIndex] = Prayer(prayerName, time);
        emit PrayerTimeSet(date, prayerName, time);
    }

    /// @notice Get prayer time by date and prayer index
    /// @param date Date in yyyymmdd format
    /// @param prayerIndex Index of prayer (0 to 4)
    /// @return prayerName Name of the prayer
    /// @return time Unix timestamp of prayer time
    function getPrayerTime(uint256 date, uint8 prayerIndex) external view returns (string memory prayerName, uint256 time) {
        require(prayerIndex < 5, "Invalid prayer index");
        Prayer memory p = dailyPrayers[date][prayerIndex];
        return (p.name, p.time);
    }
}
