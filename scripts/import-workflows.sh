#!/bin/bash
echo "📥 Importing all workflows..."
echo ""

# Count workflows
total=$(ls ../workflows/*.json 2>/dev/null | wc -l)
count=0

for workflow in ../workflows/*.json; do
    if [ -f "$workflow" ]; then
        count=$((count + 1))
        filename=$(basename "$workflow")
        echo "[$count/$total] Importing: $filename"
        npx n8n import:workflow --input="$workflow" > /dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo "✅ Successfully imported: $filename"
        else
            echo "❌ Failed to import: $filename"
        fi
        echo ""
    fi
done

echo "✅ Import complete! Imported $count workflows."
echo ""
echo "📝 Available workflows:"
echo "- piapi-if-based.json: Basic IF-based routing"
echo "- piapi-complete-with-polling.json: Advanced with status polling"
echo "- piapi-download-content.json: Content download and storage"
echo "- piapi-advanced-models.json: Flux Pro/Dev, Midjourney, Kling"
