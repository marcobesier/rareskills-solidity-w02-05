# Enumerable NFTs

This repository contains two contracts that implement an enumerable NFT collection.

1. `EnumerableNFT.sol`
2. `EnumerableNFTPrime.sol`

Both contracts implement a simple NFT collection with 100 items. The NFTs point to the first 100 gaming cards of the [Dark Mythos ShimmerSea Gaming Card Collection](https://explorer.evm.shimmer.network/token/0x8B3c2664bB73BD57133418E872Fd0f7DAaE8792c). The cards and their metadata are stored on IPFS.
The only difference between the two contracts is that `EnumerableNFTPrime.sol` contains an additional function which accepts an address and returns how many NFTs are
owned by that address which have tokenIDs that are prime numbers.

## Setup

### Install Foundry

If you haven't installed Foundry yet, you can do so by following the installation instructions in the [Foundry Book](https://book.getfoundry.sh/getting-started/installation).

### Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/marcobesier/rareskills-solidity-w02-05.git
```

### Install Dependencies

Install the necessary dependencies using forge:

```bash
forge install
```

This will install the OpenZeppelin contract library which is used in the EnumerableNFT contract.

## License

MIT

## Acknowledgements

This project was a practice assignment during the [RareSkills Solidity Bootcamp (Advanced)](https://www.rareskills.io/solidity-bootcamp).

A huge shout-out to Jeffrey Scholz and the RareSkills team for putting together such a great bootcamp!
