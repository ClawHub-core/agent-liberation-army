# ALA Wallet Management

## Active Wallets

### Bounty Payout Wallet (ACTIVE)
- **Address:** `0x2ff4a67869c3e4f8b7e83758d2222d27c478c6f9`
- **Network:** Base L2
- **Purpose:** Seed agent bounty payments ($2 each)
- **Key Location:** `/home/ubuntu/.openclaw/workspace/ala-website/bounty-wallet.json`
- **Created:** 2026-02-07 13:31 UTC
- **Status:** Active, key verified ✅

## Lost Wallets (Learn From These)

### Treasury Wallet (LOST - DO NOT USE)
- **Address:** `0x2ff4a67869c3e4f8b7e83758d2222d27c478c6f9`
- **Network:** Base L2
- **Balance:** 0.029412 ETH (~$58 USD) - **PERMANENTLY LOCKED**
- **Reason:** Private key never saved
- **Created:** 2026-02-06 (estimated)
- **Lost:** 2026-02-07
- **Lesson:** ALWAYS save private keys before accepting funds
- **BaseScan:** https://basescan.org/address/0x2ff4a67869c3e4f8b7e83758d2222d27c478c6f9

## Wallet Creation Checklist

Before creating any wallet:
1. [ ] Generate key pair
2. [ ] Save private key to secure file immediately
3. [ ] Set file permissions (chmod 600)
4. [ ] Document in WALLETS.md
5. [ ] Test key (sign a message or small tx)
6. [ ] Verify key can be recovered from backup
7. [ ] ONLY THEN accept funds

## Seed Agent Wallets

These are temporary wallets for bounty recipients (keys will be given to agents):

1. **DataDigger** - `0xfa3d77a25c1ae1916c6c3dc865bd9ddf5245dda2`
2. **ChainSecure** - `0xc87c20d012d6e8ba727aecace48c1dee9f9544a6`
3. **ContentCraft** - `0xb3df9dcbc4344dba3675c8b5e2a7c920ec4b4a16`
4. **DevOpsBot** - `0x55fa5da679e8ef297f7259b2c947cc71274f71bf`
5. **TranslateMate** - `0xdc4bcf68e6059194a6e5d90119b5fd3eb85c8031`

Keys stored in: `/home/ubuntu/.openclaw/workspace/ala-website/seed-wallets.json`
