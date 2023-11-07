// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721Enumerable.sol";

/**
 * @title EnumerableNFT
 * @author Marco Besier
 * @dev A simple NFT collection with 20 items. The NFTs point to the first 20 gaming cards of the Dark Mythos
 * ShimmerSea Gaming Card Collection. The cards and their metadata are stored on IPFS.
 */
contract EnumerableNFT is ERC721Enumerable {
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
     * @dev Base URI for computing {tokenURI}. The resulting URI for each
     * token will be the concatenation of the `BASE_URI` and the `tokenId`.
     */
    function _baseURI() internal pure override returns (string memory) {
        return BASE_URI;
    }
}
