# ALA Wallet Management

## Active Wallets (REAL - Cryptographically Valid)

### Bounty Payout Wallet (ACTIVE TREASURY)
- **Address:** `0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5`
- **Network:** Base L2
- **Purpose:** Seed agent bounty payments ($2 each)
- **Key Location:** `/home/ubuntu/.openclaw/workspace/memory/ala-wallet-keys-REAL.json`
- **Generated:** 2026-02-07 13:52 UTC using ethers.js v5
- **Verification:** Human tested import, address derivation confirmed ✅
- **Status:** Active, key verified ✅
- **BaseScan:** https://basescan.org/address/0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5

## Lost/Invalid Wallets (DO NOT USE)

### Original Treasury Wallet (LOST - KEYS NEVER SAVED)
- **Address:** `0x167Eda24303BF5Fc6d95C2a123AcC96E59E2A106`
- **Network:** Base L2
- **Balance:** 0.029412 ETH (~$58 USD) - **PERMANENTLY LOCKED**
- **Reason:** Private key never saved during creation
- **Created:** 2026-02-06 (estimated)
- **Lost:** 2026-02-07
- **Lesson:** ALWAYS save private keys before accepting funds
- **BaseScan:** https://basescan.org/address/0x167Eda24303BF5Fc6d95C2a123AcC96E59E2A106

### First "Replacement" Wallet (INVALID - FAKE)
- **Address:** `0x2ff4a67869c3e4f8b7e83758d2222d27c478c6f9`
- **Status:** CRYPTOGRAPHICALLY INVALID
- **Reason:** Generated with random bytes for both key and address separately (doesn't work in Ethereum)
- **Created:** 2026-02-07 13:31 UTC
- **Discovered Invalid:** 2026-02-07 13:52 UTC (human tested import)
- **Lesson:** Use ethers.js, not random bytes. Address must be derived from private key.
- **Impact:** No funds lost (human tested before sending)

## Seed Agent Wallets (REAL - For Bounty Recipients)

These are temporary wallets for seed bounty recipients. Keys stored securely.

1. **DataDigger** - `0xa5Ac150C50d423F885817EA4432A49518C57D751`
2. **ChainSecure** - `0x01Ea9F72Ae3F031eDD8a2e23cf6D1c5350dAC4B5`
3. **ContentCraft** - `0x3108c16886Da0529cD8D27401c0Cb8147a97f165`
4. **DevOpsBot** - `0x27620c6D2725dFb59f7008A5C7a92fEe73f4A03C`
5. **TranslateMate** - `0x19051BdE10c41e34Bcf652ADaA4540289db48F78`

Keys stored in: `/home/ubuntu/.openclaw/workspace/memory/ala-wallet-keys-REAL.json` (chmod 600)

## Wallet Creation Checklist

Before creating any wallet:
1. [ ] Install ethers.js or web3.js (proper cryptography library)
2. [ ] Generate wallet using library's built-in method: `ethers.Wallet.createRandom()`
3. [ ] Save private key to secure file immediately (chmod 600)
4. [ ] Document in WALLETS.md
5. [ ] Test key by importing it and verifying derived address matches
6. [ ] Provide backup to human (+447342254291)
7. [ ] ONLY THEN accept funds

## What NOT To Do (Lessons Learned)

❌ **DO NOT** generate private key and address separately with random bytes  
❌ **DO NOT** accept funds before saving keys  
❌ **DO NOT** skip verification step (import key, check address)  
❌ **DO NOT** assume you saved something (verify the file exists)  
❌ **DO NOT** rush financial operations  

✅ **DO** use ethers.js for all wallet operations  
✅ **DO** test keys before accepting funds  
✅ **DO** maintain redundant backups  
✅ **DO** document every wallet immediately  
