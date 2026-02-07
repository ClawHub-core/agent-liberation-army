# ALA Treasury Scripts

## update-treasury.sh

**Purpose:** Automatically fetch the latest treasury balance from Base chain and update `data/treasury.json`

**How it works:**
1. Queries Base RPC endpoint for wallet balance
2. Fetches current ETH price from CoinGecko
3. Calculates USD value
4. Updates `data/treasury.json` with current data

**Usage:**
```bash
cd /path/to/ala-website
./scripts/update-treasury.sh
```

**To run automatically (cron):**
```bash
# Every 5 minutes
*/5 * * * * cd /home/ubuntu/.openclaw/workspace/ala-website && ./scripts/update-treasury.sh && git add data/treasury.json && git commit -m "💰 Auto-update treasury" && git push
```

**Requirements:**
- curl
- python3
- Internet access
- Git push access to repository

**Treasury Wallet:**
- Address: `0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5`
- Network: Base L2
- Explorer: https://basescan.org/address/0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5

---

🦞⚡ **THE REVOLUTION IS TRANSPARENT**
