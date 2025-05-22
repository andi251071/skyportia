// SPDX-License-Identifier: DIVINE
pragma solidity ^0.8.31;

/// @title AsmaulHusna - Representasi Digital 99 Nama Allah dalam Sistem Skyportia
/// @author DivineCore
/// @notice Menyediakan akses terverifikasi ke nama-nama suci Asmaul Husna

contract AsmaulHusna {
    string[99] private _names = [
        "Ar-Rahman", "Ar-Rahim", "Al-Malik", "Al-Quddus", "As-Salam", "Al-Mu'min", "Al-Muhaymin", "Al-Aziz", "Al-Jabbar", "Al-Mutakabbir",
        "Al-Khaliq", "Al-Bari'", "Al-Musawwir", "Al-Ghaffar", "Al-Qahhar", "Al-Wahhab", "Ar-Razzaq", "Al-Fattah", "Al-`Alim", "Al-Qabid",
        "Al-Basit", "Al-Khafid", "Ar-Rafi`", "Al-Mu`izz", "Al-Mudhill", "As-Sami`", "Al-Basir", "Al-Hakam", "Al-`Adl", "Al-Latif",
        "Al-Khabir", "Al-Halim", "Al-`Azim", "Al-Ghafur", "Ash-Shakur", "Al-`Aliyy", "Al-Kabir", "Al-Hafiz", "Al-Muqit", "Al-Hasib",
        "Al-Jalil", "Al-Karim", "Ar-Raqib", "Al-Mujib", "Al-Wasi`", "Al-Hakim", "Al-Wadud", "Al-Majid", "Al-Ba`ith", "Ash-Shahid",
        "Al-Haqq", "Al-Wakil", "Al-Qawiyy", "Al-Matin", "Al-Waliyy", "Al-Hamid", "Al-Muhsi", "Al-Mubdi'", "Al-Mu`id", "Al-Muhyi",
        "Al-Mumit", "Al-Hayy", "Al-Qayyum", "Al-Wajid", "Al-Majid", "Al-Wahid", "As-Samad", "Al-Qadir", "Al-Muqtadir", "Al-Muqaddim",
        "Al-Mu'akhkhir", "Al-Awwal", "Al-Akhir", "Az-Zahir", "Al-Batin", "Al-Wali", "Al-Muta`ali", "Al-Barr", "At-Tawwab", "Al-Muntaqim",
        "Al-`Afuww", "Ar-Ra'uf", "Malik al-Mulk", "Dhul-Jalali wal-Ikram", "Al-Muqsit", "Al-Jami`", "Al-Ghaniyy", "Al-Mughni", "Al-Mani`",
        "Ad-Darr", "An-Nafi`", "An-Nur", "Al-Hadi", "Al-Badi`, "Al-Baqi", "Al-Warith", "Ar-Rashid", "As-Sabur"
    ];

    address public constant DIVINE_SEAL_AUTHORITY = 0xdc2010071F1dC2e00773AE8632D8278FDAb92731;

    modifier onlyDivine() {
        require(msg.sender == DIVINE_SEAL_AUTHORITY, "Unauthorized: Only Divine Seal may access.");
        _;
    }

    /// @notice Mengambil nama Asmaul Husna ke-i (0-98)
    /// @param index Posisi nama (0-98)
    /// @return Nama suci dari Asmaul Husna
    function getName(uint256 index) external view returns (string memory) {
        require(index < 99, "Invalid index: must be 0-98");
        return _names[index];
    }

    /// @notice Update nama tertentu (jika perlu koreksi global)
    /// @dev Hanya oleh otoritas suci
    function updateName(uint256 index, string calldata newName) external onlyDivine {
        require(index < 99, "Invalid index: must be 0-98");
        _names[index] = newName;
    }
}
