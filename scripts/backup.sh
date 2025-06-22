#!/bin/bash
echo "💾 Creating backup..."

# Create backup directory with timestamp
BACKUP_DIR="../backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Export all workflows
npx n8n export:workflow --output="$BACKUP_DIR/workflows.json" --all

# Copy database
cp ~/.n8n/database.sqlite "$BACKUP_DIR/"

# Copy config
cp ~/.n8n/config "$BACKUP_DIR/"

echo "✅ Backup created in: $BACKUP_DIR"
