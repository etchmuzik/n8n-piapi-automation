# 🚀 MCP-Powered n8n Automation

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

## Next Steps

1. Update `configs/credentials-template.json` with real API keys
2. Add new workflows to `workflows/` directory
3. Run tests regularly with `test-workflows.sh`
4. Set up GitHub integration for version control
