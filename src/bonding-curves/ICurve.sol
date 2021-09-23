// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import {CurveErrorCodes} from "./CurveErrorCodes.sol";

interface ICurve {
    function validateDelta(uint256 delta) external pure returns (bool valid);

    function getBuyInfo(
        uint256 spotPrice,
        uint256 delta,
        uint256 numItems,
        uint256 feeMultiplier,
        uint256 protocolFeeMultiplier
    )
        external
        pure
        returns (
            CurveErrorCodes.Error error,
            uint256 newSpotPrice,
            uint256 inputValue,
            uint256 protocolFee
        );

    function getSellInfo(
        uint256 spotPrice,
        uint256 delta,
        uint256 numItems,
        uint256 feeMultiplier,
        uint256 protocolFeeMultiplier
    )
        external
        pure
        returns (
            CurveErrorCodes.Error error,
            uint256 newSpotPrice,
            uint256 outputValue,
            uint256 protocolFee
        );
}