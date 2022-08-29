# Auction-Pathway

Solidity Mapping: https://solidity-by-example.org/mapping/

Local creation Commands:
```
1. npx create-react-app react-dapp
2. cd react-dapp/
3. npm install ethers hardhat @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers


```

1. Ethers - To interact with Smart Contract from Frontend.
2. Hardhat - Hardhat is an Ethereum development environment. Compile your contracts and run them on a development network.
Hardhat dependencies -
a. hardhat-waffle
b. ethereum-waffle 
c. hardhat-ethers
3. Chai - For testing

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
hardhat.config.js

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
