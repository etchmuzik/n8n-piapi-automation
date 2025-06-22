const axios = require('axios');

const WEBHOOK_URL = 'http://localhost:5678/webhook/piapi-test';

async function testWorkflows() {
    console.log('🧪 Running automated workflow tests...\n');
    
    const tests = [
        {
            name: 'Image Generation',
            data: { command: 'image', prompt: 'a red car' }
        },
        {
            name: 'Music Generation', 
            data: { command: 'music', prompt: 'electronic music' }
        }
    ];
    
    for (const test of tests) {
        try {
            console.log(`Testing: ${test.name}`);
            const response = await axios.post(WEBHOOK_URL, test.data);
            console.log(`✅ ${test.name}: SUCCESS`);
            console.log(`Response: ${JSON.stringify(response.data, null, 2)}\n`);
        } catch (error) {
            console.log(`❌ ${test.name}: FAILED`);
            console.log(`Error: ${error.message}\n`);
        }
    }
}

if (require.main === module) {
    testWorkflows();
}

module.exports = { testWorkflows };
