// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title BitOps - Utilidades de compresión lógica para Xetcompressor v0.1
/// @notice Operaciones bitwise optimizadas para manipulación de flags y slots

library BitOps {
    function setBit(uint256 value, uint8 position) internal pure returns (uint256) {
        return value | (1 << position);
    }

    function clearBit(uint256 value, uint8 position) internal pure returns (uint256) {
        return value & ~(1 << position);
    }

    function toggleBit(uint256 value, uint8 position) internal pure returns (uint256) {
        return value ^ (1 << position);
    }

    function isBitSet(uint256 value, uint8 position) internal pure returns (bool) {
        return (value & (1 << position)) != 0;
    }

    function mask(uint8 position) internal pure returns (uint256) {
        return (1 << position);
    }
}
