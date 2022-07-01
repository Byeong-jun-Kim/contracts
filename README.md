# contracts

### This contract is written to support contract-level metadata of Opensea based on KIP17(Kakao Klaytn)

- Klaytn KIP17: https://github.com/klaytn/klaytn-contracts/tree/master/contracts/KIP/token/KIP17
- Opensea contract-level metadata: https://docs.opensea.io/docs/contract-level-metadata

#### Supports
- KIP17
- KIP17MetadataMintable
- KIP17Enumerable
- KIP17Burnable
- KIP17Pausable

#### Not supports
- KIP17Mintable

## How to use
1. `yarn install`
2. `yarn compile clm1.sol`
3. use files `dist/clm1_sol_CLM1.abi` & `dist/clm1_sol_CLM1.bin`
