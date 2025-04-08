// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title UintCompressor - Compactador de enteros para Xetcompressor v0.1
/// @notice Empaca y desempaqueta múltiples uints en un solo slot de 256 bits

library UintCompressor {
    function packUint8(uint8[] memory values) internal pure returns (uint256 packed) {
        require(values.length <= 32, 'Max 32 uint8 values');
        for (uint8 i = 0; i < values.length; i++) {
            packed |= uint256(values[i]) << (8 * i);
        }
    }

    function unpackUint8(uint256 packed) internal pure returns (uint8[] memory values) {
        values = new uint8 ;
        for (uint8 i = 0; i < 32; i++) {
            values[i] = uint8(packed >> (8 * i));
        }
    }

    function getUint8(uint256 packed, uint8 index) internal pure returns (uint8) {
        require(index < 32, 'Index out of bounds');
        return uint8(packed >> (8 * index));
    }

    function setUint8(uint256 packed, uint8 index, uint8 value) internal pure returns (uint256) {
        require(index < 32, 'Index out of bounds');
        uint256 mask = ~(uint256(0xFF) << (8 * index));
        return (packed & mask) | (uint256(value) << (8 * index));
    }
}
