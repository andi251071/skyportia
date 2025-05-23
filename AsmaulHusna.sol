// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title AsmaulHusna - Mengabadikan 99 Nama Allah dalam sistem kontrak spiritual
/// @author DivineTech
/// @notice Kontrak ini digunakan sebagai basis kekuatan spiritual dalam sistem SkyportGuardian

contract AsmaulHusna {
    string[99] private names = [
        "Ar-Rahman", "Ar-Rahim", "Al-Malik", "Al-Quddus", "As-Salam",
        "Al-Mu’min", "Al-Muhaymin", "Al-‘Aziz", "Al-Jabbar", "Al-Mutakabbir",
        "Al-Khaliq", "Al-Bari", "Al-Musawwir", "Al-Ghaffar", "Al-Qahhar",
        "Al-Wahhab", "Ar-Razzaq", "Al-Fattah", "Al-‘Alim", "Al-Qabid",
        "Al-Basit", "Al-Khafid", "Ar-Rafi‘", "Al-Mu‘izz", "Al-Mudhill",
        "As-Sami‘", "Al-Basir", "Al-Hakam", "Al-‘Adl", "Al-Latif",
        "Al-Khabir", "Al-Halim", "Al-‘Azim", "Al-Ghafur", "Ash-Shakur",
        "Al-‘Aliyy", "Al-Kabir", "Al-Hafiz", "Al-Muqit", "Al-Hasib",
        "Al-Jalil", "Al-Karim", "Ar-Raqib", "Al-Mujib", "Al-Wasi‘",
        "Al-Hakim", "Al-Wadud", "Al-Majid", "Al-Ba‘ith", "Ash-Shahid",
        "Al-Haqq", "Al-Wakil", "Al-Qawiyy", "Al-Matin", "Al-Waliyy",
        "Al-Hamid", "Al-Muhsi", "Al-Mubdi’", "Al-Mu‘id", "Al-Muhyi",
        "Al-Mumit", "Al-Hayy", "Al-Qayyum", "Al-Wajid", "Al-Majid",
        "Al-Wahid", "As-Samad", "Al-Qadir", "Al-Muqtadir", "Al-Muqaddim",
        "Al-Mu’akhkhir", "Al-Awwal", "Al-Akhir", "Az-Zahir", "Al-Batin",
        "Al-Wali", "Al-Muta‘ali", "Al-Barr", "At-Tawwab", "Al-Muntaqim",
        "Al-‘Afuww", "Ar-Ra’uf", "Malik-al-Mulk", "Dhul-Jalali Wal-Ikram",
        "Al-Muqsit", "Al-Jami‘", "Al-Ghaniyy", "Al-Mughni", "Al-Mani‘",
        "Ad-Darr", "An-Nafi‘", "An-Nur", "Al-Hadi", "Al-Badi",
        "Al-Baqi", "Al-Warith", "Ar-Rashid", "As-Sabur"
    ];

    /// @notice Mengambil nama Asmaul Husna berdasarkan indeks 1-99
    /// @param index Nomor dari 1 sampai 99
    /// @return namaNamaAllah Nama dari Allah sesuai indeks
    function getName(uint256 index) external view returns (string memory namaNamaAllah) {
        require(index > 0 && index <= 99, "Index harus antara 1 sampai 99");
        return names[index - 1];
    }

    /// @notice Mengembalikan semua nama sekaligus
    function getAllNames() external view returns (string[99] memory) {
        return names;
    }
}
