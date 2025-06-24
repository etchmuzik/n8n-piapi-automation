#!/bin/bash

echo "🧪 Testing Advanced PiAPI Workflows"
echo "===================================="
echo ""

# Base URL
BASE_URL="http://localhost:5678/webhook"

# Test 1: Complete workflow with polling
echo "1️⃣ Testing Complete Workflow with Polling"
echo "Testing image generation with status polling..."
response=$(curl -s -X POST "$BASE_URL/piapi-generate" \
  -H "Content-Type: application/json" \
  -d '{
    "command": "image",
    "prompt": "a futuristic cityscape at sunset",
    "width": 1024,
    "height": 1024
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
sleep 2

# Test 2: Music generation with polling
echo "2️⃣ Testing Music Generation with Polling"
response=$(curl -s -X POST "$BASE_URL/piapi-generate" \
  -H "Content-Type: application/json" \
  -d '{
    "command": "music",
    "prompt": "upbeat electronic dance music",
    "instrumental": false
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
sleep 2

# Test 3: Video generation
echo "3️⃣ Testing Video Generation"
response=$(curl -s -X POST "$BASE_URL/piapi-generate" \
  -H "Content-Type: application/json" \
  -d '{
    "command": "video",
    "prompt": "a serene beach with waves",
    "aspect_ratio": "16:9"
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
sleep 2

# Test 4: Advanced models - Flux Pro
echo "4️⃣ Testing Advanced Models - Flux Pro"
response=$(curl -s -X POST "$BASE_URL/piapi-advanced" \
  -H "Content-Type: application/json" \
  -d '{
    "model_type": "flux-pro",
    "prompt": "professional photography of a luxury car",
    "width": 1024,
    "height": 1024,
    "guidance_scale": 7.5,
    "steps": 50
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
sleep 2

# Test 5: Midjourney
echo "5️⃣ Testing Midjourney"
response=$(curl -s -X POST "$BASE_URL/piapi-advanced" \
  -H "Content-Type: application/json" \
  -d '{
    "model_type": "midjourney",
    "prompt": "fantasy landscape with castle --ar 16:9 --s 100",
    "aspect_ratio": "16:9",
    "stylize": 100,
    "quality": 1
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
sleep 2

# Test 6: Download workflow (requires a successful task_id)
echo "6️⃣ Testing Download Workflow"
echo "Note: This requires a completed task_id with result_url"
response=$(curl -s -X POST "$BASE_URL/piapi-download" \
  -H "Content-Type: application/json" \
  -d '{
    "task_id": "test-task-id",
    "type": "image",
    "result_url": "https://example.com/test-image.png"
  }')

if [ ! -z "$response" ]; then
    echo "✅ Response received:"
    echo "$response" | jq . 2>/dev/null || echo "$response"
else
    echo "❌ No response received"
fi

echo ""
echo "✅ All workflow tests completed!"
echo ""
echo "📊 Summary:"
echo "- Complete workflow with polling: Check task creation and status"
echo "- Advanced models: Test different PiAPI models"
echo "- Download workflow: Ready for content storage"
echo ""
echo "📝 Next steps:"
echo "1. Import all workflows: ./import-workflows.sh"
echo "2. Monitor logs: tail -f ../logs/n8n.log"
echo "3. Check webhook endpoints in n8n UI"