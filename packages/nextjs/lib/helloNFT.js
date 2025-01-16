// lib/helloNFT.js
import { getProvider } from "./web3";
import { ethers } from "ethers";

// 合约地址和 ABI
const contractAddress = "0xYourHelloNFTContractAddress";
const contractABI = [
  // 这里放置 HelloNFT 合约的 ABI
];

export async function mintHelloNFT(account) {
  const provider = getProvider();
  const signer = provider.getSigner(account);
  const contract = new ethers.Contract(contractAddress, contractABI, signer);

  try {
    const tx = await contract.mint();
    await tx.wait();
    console.log("Minting successful:", tx);
  } catch (error) {
    console.error("Minting failed:", error);
  }
}
