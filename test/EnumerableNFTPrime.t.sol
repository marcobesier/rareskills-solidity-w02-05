// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {EnumerableNFTPrime} from "../src/EnumerableNFTPrime.sol";

contract EnumerableNFTPrimeTest is Test {
    EnumerableNFTPrime public enumerableNFTPrime;

    function setUp() public {
        enumerableNFTPrime = new EnumerableNFTPrime();
    }

    function test_Mint() public {
        enumerableNFTPrime.mint();
        assertEq(enumerableNFTPrime.totalSupply(), 1);
        assertEq(enumerableNFTPrime.balanceOf(address(this)), 1);
        assertEq(enumerableNFTPrime.ownerOf(1), address(this));
    }

    function test_MaxSupplyReached() public {
        for (uint256 i = 1; i <= 100; i++) {
            enumerableNFTPrime.mint();
        }
        vm.expectRevert("Maximum supply reached");
        enumerableNFTPrime.mint();
    }

    function test_BaseURI() public {
        enumerableNFTPrime.mint();
        assertEq(enumerableNFTPrime.tokenURI(1), "ipfs://bafybeih7uybsi4mcton6dlwxhn44ppi5fbzmtucmyxvrcf7bjnow7fp2vu/1");
    }

    function test_CountPrimes() public {
        for (uint256 i = 1; i <= 100; i++) {
            enumerableNFTPrime.mint();
        }
        assertEq(enumerableNFTPrime.countPrimes(address(this)), 25);
    }
}
