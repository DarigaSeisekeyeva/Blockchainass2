# Blockchain Technologies
## Assignment 2
AI Model Marketplace dApp

Overview

The AI Model Marketplace is a decentralized application (dApp) built on the Ethereum blockchain. It allows users to:

List AI Models: Creators can upload models with a name, description, and price.
Purchase AI Models: Buyers can purchase listed models with Ether (ETH).
Rate Models: Users can rate purchased models, contributing to their average score.
Withdraw Funds: Creators can withdraw funds earned from their model sales.
The application includes a Solidity smart contract to manage core functionality and a React.js frontend for an intuitive user experience.

Features

Model Listing: Add a new AI model with its details.
Marketplace View: Explore all available AI models in a grid layout.
Purchase Functionality: Buy models using ETH via blockchain transactions.
Rating System: Rate purchased models (1 to 5 stars).
Funds Management: Contract creators can withdraw accumulated earnings.
Tech Stack

Layer	Technology
Blockchain	Ethereum, Solidity
Smart Contract IDE	Remix, Ganache
Frontend	React.js, Web3.js
Wallet Integration	Metamask
Test Environment	Ganache, Goerli Testnet
Usage

Prerequisites
Install Node.js and npm.
Install Ganache for local blockchain testing.
Set up Metamask for blockchain wallet integration.
Step 1: Clone the Repository
git clone https://github.com/yourusername/ai-model-marketplace.git  
cd ai-model-marketplace  
Step 2: Install Dependencies
npm install  
Step 3: Start Ganache
Open Ganache and create a new workspace.
Copy the RPC URL (default: http://127.0.0.1:8545).
Step 4: Compile and Deploy Smart Contract
Open Remix IDE or use Hardhat/Truffle.
Compile the AIModelMarketplace.sol smart contract.
Deploy the contract to Ganache using the RPC URL.
Step 5: Configure the Frontend
Update the contract address in src/ABI/contractAddress.js.
Replace the ABI file (src/ABI/AIModelMarketplace.json) with the compiled contract's ABI.
Step 6: Start the Frontend
npm start  
Visit http://localhost:3000 in your browser to access the application.

Step 7: Testnet Deployment (Optional)
Switch to a testnet (e.g., Goerli) in Metamask.
Deploy the smart contract to the testnet using Remix or Hardhat.
Update the frontend contract address to the testnet deployment address.




![image](https://github.com/user-attachments/assets/2cefbd85-5d83-42b8-97ca-1f43a112109d)

![image](https://github.com/user-attachments/assets/daa1ca07-49e2-468f-94a2-571f88ef872c)

![image](https://github.com/user-attachments/assets/e297904c-4bcf-48af-a419-fa1503ba5c4a)
![image](https://github.com/user-attachments/assets/9b3b1edc-46ee-4d03-be6d-ef066aa5ad52)
