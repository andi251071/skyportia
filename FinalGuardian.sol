// SPDX-License-Identifier: DIVINE
pragma solidity ^0.8.31;

import "./AsmaulHusna.sol";
import "./AyatKursi.sol";
import "./SoulDatabase.sol";
import "./DivineFortress.sol";
import "./DivineIntervention.sol";

contract FinalGuardian {
    using AyatKursi for bytes32;

    address public immutable divineAuthority;
    SoulDatabase public immutable soulDB;
    DivineFortress public immutable fortress;
    DivineIntervention public immutable divine;

    event DivineAccessGranted(address indexed soul);
    event EmergencyInterventionExecuted(address indexed targetSoul);
    event SecretEncrypted(bytes32 result);

    modifier onlyDivineAuthority() {
        require(msg.sender == divineAuthority, "Not Divine Authority");
        _;
    }

    constructor(
        address _soulDB,
        address _fortress,
        address _divine
    ) {
        divineAuthority = 0xdc2010071F1dC2e00773AE8632D8278FDAb92731;
        soulDB = SoulDatabase(_soulDB);
        fortress = DivineFortress(_fortress);
        divine = DivineIntervention(_divine);
    }

    /// 🔐 Enkripsi rahasia dengan perlindungan Ayat Kursi
    function encryptWithAyatKursi(bytes32 secret, uint divineKey) external view onlyDivineAuthority returns (bytes32) {
        bytes32 result = secret.encrypt(divineKey);
        return result;
    }

    /// 📜 Verifikasi jiwa apakah layak masuk ke lingkaran ilahi
    function verifySoulPurity(address soul) public view returns (bool accepted, uint8 level) {
        (bool registered, uint8 purity) = fortress.verifySoul(soul);
        return (registered && purity >= 77, purity); // threshold suci: 77
    }

    /// ⚠️ Aktifkan Intervensi Ilahi Darurat
    function triggerDivineEmergency(address soul) external onlyDivineAuthority returns (bool) {
        emit EmergencyInterventionExecuted(soul);
        return divine.intervene(soul);
    }

    /// 📖 Pendaftaran jiwa suci secara resmi ke sistem
    function registerHolySoul(address soul, uint8 level) external onlyDivineAuthority {
        soulDB.registerSoul(soul, level);
        emit DivineAccessGranted(soul);
    }
}

