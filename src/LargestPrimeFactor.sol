// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/console.sol";

error NoPrimeFactors();

contract LargestPrimeFactor {
    function _sqrt(uint256 _n) private pure returns (uint256) {
        uint256 z = (_n + 1) / 2;
        uint256 y = _n;
        while (z < y) {
            y = z;
            z = (_n / z + z) / 2;
        }
        return y;
    }

    function computePrimeFactorization(uint256 _n)
        external
        pure
        returns (uint256)
    {
        if (_n == 0 || _n == 1) {
            revert NoPrimeFactors();
        }
        uint256 sqrtOfN = _sqrt(_n);
        uint256[] memory integersUpToN = new uint256[](_n);
        uint256 largestPrimeFactor = 2;

        for (uint256 x = 0; x < integersUpToN.length; x++) {
            if (integersUpToN[x] != 1) {
                integersUpToN[x] = x;
            }

            if (integersUpToN[x] != 0 && integersUpToN[x] != 1) {
                if (x <= sqrtOfN) {
                    for (
                        uint256 multipleOfX = x**2;
                        multipleOfX < integersUpToN.length;
                        multipleOfX += x
                    ) {
                        integersUpToN[multipleOfX] = 1;
                    }
                }
            }
        }
        for (
            uint256 primesIndex = integersUpToN.length - 1;
            primesIndex > 0;
            primesIndex--
        ) {
            if (
                integersUpToN[primesIndex] > largestPrimeFactor &&
                _n % integersUpToN[primesIndex] == 0
            ) {
                largestPrimeFactor = integersUpToN[primesIndex];
                break;
            }
        }
        return largestPrimeFactor;
    }
}
