// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {EnumerableNFT} from "../src/EnumerableNFT.sol";

contract EnumerableNFTTest is Test {
    EnumerableNFT public enumerableNFT;

    function setUp() public {
        enumerableNFT = new EnumerableNFT();
    }

    function test_Mint() public {
        enumerableNFT.mint();
        assertEq(enumerableNFT.totalSupply(), 1);
        assertEq(enumerableNFT.balanceOf(address(this)), 1);
        assertEq(enumerableNFT.ownerOf(1), address(this));
    }

    function test_MaxSupplyReached() public {
        for (uint256 i = 1; i <= 100; i++) {
            enumerableNFT.mint();
        }
        vm.expectRevert("Maximum supply reached");
        enumerableNFT.mint();
    }

    function test_BaseURI() public {
        enumerableNFT.mint();
        assertEq(enumerableNFT.tokenURI(1), "ipfs://bafybeih7uybsi4mcton6dlwxhn44ppi5fbzmtucmyxvrcf7bjnow7fp2vu/1");
    }
}
