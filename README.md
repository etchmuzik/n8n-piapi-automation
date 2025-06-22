# 🚀 n8n-piapi-automation
MCP-powered n8n workflow automation for PiAPI integration with image, music, and video generation

## Quick Start

```bash
# Setup everything
cd scripts && ./setup.sh

# Test workflows
./test-workflows.sh

# Create backup
./backup.sh
```

## Structure

- `workflows/` - n8n workflow JSON files
- `configs/` - Environment and credential configs  
- `scripts/` - Automation scripts
- `tests/` - Automated test suites
- `logs/` - Application logs
- `backups/` - Workflow backups

## Commands

- `setup.sh` - Complete n8n setup with workflows
- `import-workflows.sh` - Import all workflows
- `test-workflows.sh` - Test all endpoints
- `backup.sh` - Create full backup

## Features

✅ **Working PiAPI Integration** - Image, music, and video generation  
✅ **MCP-Powered Automation** - CLI-based workflow management  
✅ **GitHub Integration** - Version control and CI/CD  
✅ **Automated Testing** - Webhook endpoint validation  
✅ **Easy Deployment** - One-command setup and import  

## Next Steps

1. Update `configs/credentials-template.json` with real API keys
2. Add new workflows to `workflows/` directory
3. Run tests regularly with `test-workflows.sh`
4. Use GitHub Actions for automated testing
