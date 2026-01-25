// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IVerifier.sol";

/// @title MockVerifier
/// @notice Simulates a zk-STARK verifier contract
contract MockVerifier is IVerifier {

    /// @notice Pretend to verify a zk-STARK proof
    /// @dev In production, this would verify AIR constraints, FRI, etc.
    function verifyProof(
        bytes calldata proof,
        uint256 claimedPrime
    ) external pure returns (bool) {
        // MVP conditions:
        // 1. A proof blob exists
        // 2. Output is non-zero
        return proof.length > 0 && claimedPrime > 0;
    }
}
