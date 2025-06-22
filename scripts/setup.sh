#!/bin/bash
echo "🔧 Setting up n8n with MCP automation..."

# Load environment
source ../configs/n8n-settings.env

# Stop existing n8n
pkill -f n8n 2>/dev/null || true
sleep 2

# Start n8n with config
echo "Starting n8n..."
env $(cat ../configs/n8n-settings.env | xargs) npx n8n start > ../logs/n8n.log 2>&1 &

# Wait for startup
sleep 5

# Import workflows
echo "Importing workflows..."
npx n8n import:workflow --input=../workflows/piapi-if-based.json

echo "✅ Setup complete!"
echo "Access n8n at: http://localhost:5678"
