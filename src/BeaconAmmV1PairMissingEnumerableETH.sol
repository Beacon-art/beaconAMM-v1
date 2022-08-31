// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import {BeaconAmmV1PairETH} from "./BeaconAmmV1PairETH.sol";
import {BeaconAmmV1PairMissingEnumerable} from "./BeaconAmmV1PairMissingEnumerable.sol";
import {IBeaconAmmV1PairFactoryLike} from "./IBeaconAmmV1PairFactoryLike.sol";

contract BeaconAmmV1PairMissingEnumerableETH is
    BeaconAmmV1PairMissingEnumerable,
    BeaconAmmV1PairETH
{
    function pairVariant()
        public
        pure
        override
        returns (IBeaconAmmV1PairFactoryLike.PairVariant)
    {
        return IBeaconAmmV1PairFactoryLike.PairVariant.MISSING_ENUMERABLE_ETH;
    }
}