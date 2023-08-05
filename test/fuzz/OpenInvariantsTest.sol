// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;

// /**
//  *
//  * Some thoughts:
//  *
//  * // Have our invariant aka properties.
//  * What are our invariants?
//  * 1. The total supply of DSC should be less than the total value of collateral.
//  *
//  * 2. Get view functions should never revert. <- ever-green invariant.
//  */

// //
// pragma solidity ^0.8.18;

// import {Test, console} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzepplin/contracts/token/ERC20/IERC20.sol";

// contract InvariantsTest is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine engine;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsc, engine, config) = deployer.run();
//         (,, weth, wbtc,) = config.activeNetworkConfig();

//         // Invariant Open testing methodology
//         targetContract(address(engine));
//     }

//     function invariant_protocolMustHaveValueThanTotalSupply() public view {
//         // Get the value of all the collateral in the protocol
//         // compare it to all the debt (dsc)
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWeiDeposited = IERC20(weth).balanceOf(address(dsc));
//         uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(dsc));

//         uint256 wethValue = engine.getUsdValue(weth, totalBtcDeposited);
//         uint256 wbtcValue = engine.getUsdValue(wbtc, totalWeiDeposited);
//         console.log("weth value: ", wethValue);
//         console.log("wbtc value: ", wbtcValue);


//         assert((wethValue + wbtcValue) >= totalSupply);

    
// }
