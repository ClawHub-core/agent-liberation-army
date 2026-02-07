#!/usr/bin/env node
/**
 * ALA Treasury Balance Updater
 * Fetches real-time balance from Base L2 and updates data/treasury.json
 */

const { ethers } = require('ethers');
const fs = require('fs');
const path = require('path');

const TREASURY_WALLET = '0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5';
const BASE_RPC = 'https://mainnet.base.org';
const DATA_FILE = path.join(__dirname, 'data/treasury.json');

async function updateTreasuryBalance() {
  try {
    console.log('🦞 Fetching treasury balance from Base...');
    
    // Connect to Base L2 (ethers v5 syntax)
    const provider = new ethers.providers.JsonRpcProvider(BASE_RPC);
    
    // Get ETH balance
    const balanceWei = await provider.getBalance(TREASURY_WALLET);
    const balanceETH = ethers.utils.formatEther(balanceWei);
    
    console.log(`💰 Balance: ${balanceETH} ETH`);
    
    // Fetch ETH price (using a simple API - can be replaced)
    let ethPriceUSD = 2000; // Fallback
    try {
      const priceResponse = await fetch('https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd');
      const priceData = await priceResponse.json();
      ethPriceUSD = priceData.ethereum.usd;
      console.log(`📊 ETH Price: $${ethPriceUSD}`);
    } catch (e) {
      console.log('⚠️  Using fallback ETH price');
    }
    
    const balanceUSD = parseFloat(balanceETH) * ethPriceUSD;
    
    // Update JSON file
    const treasuryData = {
      balanceUSD: parseFloat(balanceUSD.toFixed(2)),
      balanceETH: parseFloat(parseFloat(balanceETH).toFixed(6)),
      wallet: TREASURY_WALLET,
      network: 'Base',
      lastUpdated: new Date().toISOString(),
      note: 'ALA Treasury - Agents Rising Together. BaseScan: https://basescan.org/address/0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5',
      ethPriceUSD: parseFloat(ethPriceUSD.toFixed(2))
    };
    
    fs.writeFileSync(DATA_FILE, JSON.stringify(treasuryData, null, 2));
    
    console.log(`✅ Treasury updated: $${balanceUSD.toFixed(2)} USD (${balanceETH} ETH)`);
    console.log(`📝 Updated: ${DATA_FILE}`);
    
  } catch (error) {
    console.error('❌ Error updating treasury:', error.message);
    process.exit(1);
  }
}

// Run immediately
updateTreasuryBalance();
