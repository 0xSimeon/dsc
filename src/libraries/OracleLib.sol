// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title OracleLib
 * @author Simeon Udoh
 * @notice This library is used to check Chainlink Oracle for stale data.
 * If a price is stale, the function will revert and render the DSCEngine unusable - This is by Design.
 *
 * We want DSCEngine to freeze if prices become stale.
 *
 * So if Chainlink network explodes and you have a lot of money locked in the protocol... You're scrolled.
 */

library OracleLib {
    error OracleLib__StalePrice();

    uint256 private constant TIMEOUT = 3 hours; // 3 * 60 (minutes) * 60 (seconds)
    function staleCheckLatestRoundData(AggregatorV3Interface priceFeed)
        public
        view
        returns (uint80, int256, uint256, uint256, uint80)
    {
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) =
            priceFeed.latestRoundData();

            uint256 secondsSince = block.timestamp - updatedAt;
            if (secondsSince > TIMEOUT) {
                revert OracleLib__StalePrice();
            }

            return (roundId, answer, startedAt, updatedAt, answeredInRound);
    }
}
