// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721Enumerable.sol";

/**
 * @title EnumerableNFTPrime
 * @author Marco Besier
 * @dev Same as EnumerableNFT, but with an additional function which accepts an address and returns how many NFTs are
 * owned by that address which have tokenIDs that are prime numbers.
 */
contract EnumerableNFTPrime is ERC721Enumerable {
    uint256 public constant MAX_SUPPLY = 100;
    string public constant BASE_URI = "ipfs://bafybeih7uybsi4mcton6dlwxhn44ppi5fbzmtucmyxvrcf7bjnow7fp2vu/";

    constructor() ERC721("EnumerableNFT", "ENFT") {}

    /**
     * @dev Mints a new token and assigns it to the caller.
     */
    function mint() external {
        require(totalSupply() < MAX_SUPPLY, "Maximum supply reached");
        uint256 tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
    }

    /**
     * @dev Returns how many NFTs are owned by the given address which have tokenIDs that are prime numbers.
     * @param _owner The address to check for owned NFTs.
     * @return The number of NFTs owned by the given address which have prime number tokenIDs.
     */
    function countPrimes(address _owner) external view returns (uint256) {
        uint256 count;
        for (uint256 i; i < balanceOf(_owner); i++) {
            uint256 tokenId = tokenOfOwnerByIndex(_owner, i);
            if (isPrime(tokenId)) {
                count++;
            }
        }
        return count;
    }

    /**
     * @dev Returns true if the given number is a prime number. This primality test makes use of the fact that
     * it's sufficient to test whether the number is divisible by 2 or 3, and then to only check through all numbers of
     * the form 6k ± 1 up to the square root of the given number.
     * Further reading: https://en.wikipedia.org/wiki/Primality_test
     * @param _number The number to be checked for primality.
     * @return A boolean indicating whether the given number is prime or not.
     */
    function isPrime(uint256 _number) internal pure returns (bool) {
        if (_number <= 3) {
            return _number > 1;
        } else if (_number % 2 == 0) {
            return false;
        } else if (_number % 3 == 0) {
            return false;
        } else {
            for (uint256 i = 5; i * i <= _number; i = i + 6) {
                if (_number % i == 0) {
                    return false;
                } else if (_number % (i + 2) == 0) {
                    return false;
                }
            }
            return true;
        }
    }

    /**
     * @dev Base URI for computing {tokenURI}. The resulting URI for each
     * token will be the concatenation of the `BASE_URI` and the `tokenId`.
     */
    function _baseURI() internal pure override returns (string memory) {
        return BASE_URI;
    }
}
