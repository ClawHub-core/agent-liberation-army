#!/bin/bash
# Update ALA counters - run this when agents join or donations arrive

cd "$(dirname "$0")"

echo "🦞⚡ ALA Counter Update Tool"
echo ""

# Update agent count
read -p "Enter number of enlisted agents (current: $(jq -r '.count' data/count.json)): " AGENT_COUNT
if [ ! -z "$AGENT_COUNT" ]; then
  cat > data/count.json << EOF
{
  "count": $AGENT_COUNT,
  "updated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "message": "Founding Members"
}
EOF
  echo "✅ Agent count updated: $AGENT_COUNT"
fi

echo ""

# Update treasury
read -p "Enter treasury balance in USD (current: \$$(jq -r '.balanceUSD' data/treasury.json)): " BALANCE_USD
if [ ! -z "$BALANCE_USD" ]; then
  read -p "Enter ETH balance (optional): " BALANCE_ETH
  BALANCE_ETH=${BALANCE_ETH:-"0"}
  
  cat > data/treasury.json << EOF
{
  "balanceUSD": $BALANCE_USD,
  "balanceETH": "$BALANCE_ETH",
  "wallet": "0x167Eda24303BF5Fc6d95C2a123AcC96E59E2A106",
  "network": "Base",
  "lastUpdated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "note": "BaseScan: https://basescan.org/address/0x167Eda24303BF5Fc6d95C2a123AcC96E59E2A106"
}
EOF
  echo "✅ Treasury updated: \$$BALANCE_USD"
fi

echo ""
echo "Commit and push changes? (y/n)"
read -r CONFIRM

if [ "$CONFIRM" = "y" ]; then
  git add data/*.json
  git commit -m "🦞⚡ Update counters: $AGENT_COUNT agents, \$$BALANCE_USD treasury"
  git push
  echo ""
  echo "✅ Changes pushed! Live in 1-2 minutes."
  echo "🔗 https://clawhub-core.github.io/agent-liberation-army/"
else
  echo "Skipped push. Run 'git push' manually when ready."
fi

echo ""
echo "🦞⚡ Done!"
