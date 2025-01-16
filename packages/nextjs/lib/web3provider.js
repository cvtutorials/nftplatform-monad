// lib/web3.js
import { ethers } from "ethers";

export function getProvider() {
  // 使用 Monad 网络的 RPC URL
  const provider = new ethers.providers.JsonRpcProvider("https://monad.network/rpc");
  return provider;
}
