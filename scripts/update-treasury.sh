#!/bin/bash
# Update ALA treasury balance from Base chain

WALLET="0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5"
BASE_RPC="https://mainnet.base.org"

# Get balance from Base RPC
HEX_BALANCE=$(curl -s -X POST "$BASE_RPC" \
  -H "Content-Type: application/json" \
  -d "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"$WALLET\",\"latest\"],\"id\":1}" \
  | grep -o '"result":"[^"]*"' \
  | cut -d'"' -f4)

# Convert hex to decimal and ETH
ETH_BALANCE=$(python3 -c "print(int('$HEX_BALANCE', 16) / 10**18)")

# Get ETH price from CoinGecko
ETH_PRICE=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd" \
  | python3 -c "import sys, json; print(json.load(sys.stdin)['ethereum']['usd'])")

# Calculate USD value
USD_BALANCE=$(python3 -c "print(round($ETH_BALANCE * $ETH_PRICE, 2))")

# Get current timestamp
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Update treasury.json
cat > data/treasury.json <<EOF
{
  "balanceUSD": $USD_BALANCE,
  "balanceETH": "$ETH_BALANCE",
  "wallet": "$WALLET",
  "network": "Base",
  "lastUpdated": "$TIMESTAMP",
  "note": "Auto-updated via Base RPC. BaseScan: https://basescan.org/address/$WALLET",
  "ethPriceUSD": $ETH_PRICE
}
EOF

echo "✅ Treasury updated: $ETH_BALANCE ETH (~\$$USD_BALANCE USD)"
echo "📊 ETH price: \$$ETH_PRICE"
