// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "forge-std/console.sol";
import "src/LargestPrimeFactor.sol";

contract ContractTest is DSTest {
    LargestPrimeFactor public c;

    function setUp() public {
        c = new LargestPrimeFactor();
    }

    function testPrimeFactorization() public {
        uint256 result0 = c.computePrimeFactorization(2);
        console.log(result0);
        assertEq(result0, 2);

        uint256 result1 = c.computePrimeFactorization(9);
        console.log(result1);
        assertEq(result1, 3);

        uint256 result2 = c.computePrimeFactorization(22);
        console.log(result2);
        assertEq(result2, 11);

        uint256 result3 = c.computePrimeFactorization(13195);
        console.log(result3);
        assertEq(result3, 29);

        uint256 result4 = c.computePrimeFactorization(17391);
        console.log(result4);
        assertEq(result4, 31);
    }
}
