#!/bin/bash
echo "📥 Importing all workflows..."

for workflow in ../workflows/*.json; do
    echo "Importing: $workflow"
    npx n8n import:workflow --input="$workflow"
done

echo "✅ All workflows imported!"
