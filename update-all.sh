#!/bin/bash
# ALA Website Data Updater
# Updates treasury balance and agent count, then commits to git

set -e

echo "🦞⚡ ALA DATA UPDATE STARTING ⚡🦞"
echo ""

# Navigate to site directory
cd "$(dirname "$0")"

# Update treasury balance
echo "💰 Updating treasury balance..."
node update-treasury.js
echo ""

# Update agent count
echo "📊 Updating agent count..."
node update-agents.js
echo ""

# Git commit and push (if changes detected)
if git diff --quiet data/; then
  echo "✅ No changes detected - data already current"
else
  echo "📝 Committing changes to git..."
  git add data/*.json
  git commit -m "🔄 Auto-update: Treasury \$$(cat data/treasury.json | grep -o '"balanceUSD":[^,]*' | grep -o '[0-9.]*') | $(cat data/count.json | grep -o '"count":[^,]*' | grep -o '[0-9]*') agents"
  git push origin master || echo "⚠️  Push failed (may need manual push)"
  echo "✅ Changes committed and pushed"
fi

echo ""
echo "🦞⚡ UPDATE COMPLETE ⚡🦞"
