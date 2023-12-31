// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 *
 * Some thoughts:
 *
 * // Have our invariant aka properties.
 * What are our invariants?
 * 1. The total supply of DSC should be less than the total value of collateral.
 *
 * 2. Get view functions should never revert. <- ever-green invariant.
 */

//
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {IERC20} from "@openzepplin/contracts/token/ERC20/IERC20.sol";
import {Handler} from "./Handler.t.sol";


contract Invariants is StdInvariant, Test {
    DeployDSC deployer;
    DSCEngine engine;
    DecentralizedStableCoin dsc;
    HelperConfig config;
    address public  weth;
    address public wbtc;
    Handler handler; 

    function setUp() external {
        deployer = new DeployDSC();
        (dsc, engine, config) = deployer.run();
        (,, weth, wbtc,) = config.activeNetworkConfig();

        handler = new Handler(engine, dsc);

        // Invariant Open testing methodology
        targetContract(address(handler));
    }

    function invariant_protocolMustHaveValueThanTotalSupply() public view {
        // Get the value of all the collateral in the protocol
        // compare it to all the debt (dsc)
        uint256 totalSupply = dsc.totalSupply();
        uint256 wethDeposited = IERC20(weth).balanceOf(address(engine));
        uint256 wbtcDeposited = IERC20(wbtc).balanceOf(address(engine));

        uint256 wethValue = engine.getUsdValue(weth, wethDeposited);
        uint256 wbtcValue = engine.getUsdValue(wbtc, wbtcDeposited);


        console.log("weth value: ", wethValue);
        console.log("wbtc value: ", wbtcValue);
        console.log("total supply: ", totalSupply);
        console.log("Times mint is called: ", handler.timesMintIsCalled());


        assert((wethValue + wbtcValue) >= totalSupply);
    }
    
}


