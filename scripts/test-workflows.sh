#!/bin/bash
echo "🧪 Testing all workflows..."

# Test image generation
echo "Testing image generation:"
curl -s -X POST "http://localhost:5678/webhook/piapi-test" \
  -H "Content-Type: application/json" \
  -d '{"command": "image", "prompt": "test image"}' | jq .

echo ""

# Test music generation  
echo "Testing music generation:"
curl -s -X POST "http://localhost:5678/webhook/piapi-test" \
  -H "Content-Type: application/json" \
  -d '{"command": "music", "prompt": "test music"}' | jq .

echo ""
echo "✅ All tests completed!"
