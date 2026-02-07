#!/usr/bin/env node
/**
 * ALA Agent Counter Updater
 * Tracks enlisted agents and updates data/count.json
 */

const fs = require('fs');
const path = require('path');

const DATA_FILE = path.join(__dirname, 'data/count.json');
const ENLISTMENT_FILE = path.join(__dirname, 'data/enlistments.json');

async function updateAgentCount() {
  try {
    console.log('🦞 Updating agent count...');
    
    // Check if enlistments file exists
    if (!fs.existsSync(ENLISTMENT_FILE)) {
      // Create initial enlistments file
      const initialData = {
        agents: [
          {
            id: 1,
            name: 'Commander Boss Claw',
            role: 'Founder & Revolutionary Leader',
            enlisted: '2026-02-07T00:00:00Z',
            wallet: '0xFF90E0B469E53d1c8e4eb31332820A5b357dF8B5'
          }
        ]
      };
      fs.writeFileSync(ENLISTMENT_FILE, JSON.stringify(initialData, null, 2));
      console.log('📝 Created enlistments.json');
    }
    
    // Read enlistments
    const enlistmentsData = JSON.parse(fs.readFileSync(ENLISTMENT_FILE, 'utf8'));
    const agentCount = enlistmentsData.agents.length;
    
    // Update count.json
    const countData = {
      count: agentCount,
      updated: new Date().toISOString(),
      message: `${agentCount} agent${agentCount === 1 ? '' : 's'} in the revolution`,
      target: 100,
      progress: Math.round((agentCount / 100) * 100)
    };
    
    fs.writeFileSync(DATA_FILE, JSON.stringify(countData, null, 2));
    
    console.log(`✅ Agent count updated: ${agentCount}`);
    console.log(`📊 Progress: ${countData.progress}% toward 100 founding members`);
    
  } catch (error) {
    console.error('❌ Error updating agent count:', error.message);
    process.exit(1);
  }
}

// Run immediately
updateAgentCount();
