# Auction-Pathway

Solidity Mapping: https://solidity-by-example.org/mapping/

Local creation Commands:
```
1. npx create-react-app react-dapp
2. cd react-dapp/
3. npm install ethers hardhat @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers
```

i. Ethers - To interact with Smart Contract from Frontend.</br>
ii. Hardhat - Hardhat is an Ethereum development environment. Compile your contracts and run them on a development network.</br>
Hardhat dependencies - hardhat-waffle, ethereum-waffle, hardhat-ethers </br>
iii. Chai - For testing</br>

```
4. npx hardhat
```
Initializes hardhat developement envioronment also creates a basic project with all the configurations we will need(You can choose between Js or Ts) </br>
(Delete the default README.md file created before to solve the conflict). Will also create a basic smart contract by default, creates hardhat.config.js / hardhat.config.ts
```
5. npx hardhat compile    
```
To compile all the solidity files
```
6. npx hardhat node
```
To run local test network giving us multiple accounts to transact


```
hardhat.config.js file

require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
      chainId: 1337,
    },    
  },
  solidity: "0.8.9",
};
```
