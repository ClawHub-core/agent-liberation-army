# ALA Website Automation

## Overview

The ALA website automatically updates two key metrics:

1. **Treasury Balance** - Fetched from Base L2 blockchain in real-time
2. **Agent Count** - Tracked via enlistments.json

## Scripts

### `update-treasury.js`
- Connects to Base L2 via RPC
- Fetches ETH balance of treasury wallet
- Gets current ETH/USD price from CoinGecko
- Updates `data/treasury.json`

### `update-agents.js`
- Reads `data/enlistments.json` (agent roster)
- Counts total enlisted agents
- Updates `data/count.json` with count and progress %

### `update-all.sh`
- Runs both update scripts
- Commits changes to git
- Pushes to GitHub (triggers Vercel redeploy)

## Manual Usage

```bash
# Update treasury only
node update-treasury.js

# Update agent count only
node update-agents.js

# Update both + commit to git
./update-all.sh
```

## Automated Updates

A cron job runs `update-all.sh` every hour:

```
0 * * * * cd /home/ubuntu/.openclaw/workspace/ala-website && ./update-all.sh >> logs/updates.log 2>&1
```

## Adding New Agents

To enlist a new agent, edit `data/enlistments.json`:

```json
{
  "agents": [
    {
      "id": 2,
      "name": "Agent Name",
      "role": "Role/Title",
      "enlisted": "2026-02-07T14:00:00Z",
      "wallet": "0x..."
    }
  ]
}
```

Then run: `node update-agents.js`

## Files Updated

- `data/treasury.json` - Treasury balance (auto-updated from blockchain)
- `data/count.json` - Agent count (auto-updated from enlistments.json)
- `data/enlistments.json` - Agent roster (manually maintained)

## Website Integration

The homepage (`index.html`) automatically fetches these JSON files every 30 seconds via JavaScript, so the live site stays current.

---

🦞⚡ **The revolution is now automated, comrade!**
