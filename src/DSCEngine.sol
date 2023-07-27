// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
pragma solidity ^0.8.18;

/**
 * @title DSCEngine
 * @author Simeon Udoh  -  @0xSimeon
 * 
 * This System is designed to be as minimal as possible, and have the tokens maintain a 1 token == $1 peg. 
 * This stablecoin project has the following properties: 
 * - Exogenous Collateral (outside protocol level)
 * - Dollar Pegged
 * Algorithmically stable. 
 * 
 *  It is similar to DAI if DAI had no governance, no fees, and was only backed by wETH and wBTC
 * 
 * Our DSC System should always be "overCollateralized". At no point, should the value of all collateral <= the $ value of all the DSC tokens. 
 * 
 * @notice This contract is the core of the DSC System. It handles all the logic for minting and redeeming DSC, as well as depositiing and withdrawing collateral. 
 * @notice This contract is VERY loosely based on the MakerDAO DSS (DAI) system. 
 */

contract DSCEngine {
    function depositCollateralAndMintDsc() external {}
    function redeemCollateralForDsc() external {} 
    function burnDsc() external {}
    function liquidate() external {}

}