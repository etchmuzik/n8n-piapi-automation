# 🚀 PiAPI Advanced Features Documentation

## Overview

This document describes the advanced features added to the n8n PiAPI automation system, including polling, multi-model support, and content management.

## New Workflows

### 1. Complete Workflow with Polling (`piapi-complete-with-polling.json`)

**Endpoint**: `POST /webhook/piapi-generate`

**Features**:
- Automatic status polling until task completion
- Configurable polling intervals and max attempts
- Support for image, music, and video generation
- Comprehensive error handling
- Returns final result URL when ready

**Request Example**:
```json
{
  "command": "image",
  "prompt": "a beautiful sunset",
  "width": 1024,
  "height": 1024,
  "model": "Qubico/flux1-schnell"  // optional
}
```

**Response Example**:
```json
{
  "success": true,
  "task_id": "12e8d550-b639-437f-b0af-14f0def3f4bc",
  "type": "image",
  "prompt": "a beautiful sunset",
  "result_url": "https://cdn.piapi.ai/generated/image.png",
  "created_at": "2024-06-23T10:00:00Z",
  "completed_at": "2024-06-23T10:00:30Z",
  "attempts": 6,
  "metadata": {
    "model": "Qubico/flux1-schnell",
    "width": 1024,
    "height": 1024
  }
}
```

### 2. Download Content Workflow (`piapi-download-content.json`)

**Endpoint**: `POST /webhook/piapi-download`

**Features**:
- Downloads generated content from PiAPI
- Organizes files by type and date
- Automatic file naming with timestamps
- Support for images, music, and video files

**Request Example**:
```json
{
  "task_id": "12e8d550-b639-437f-b0af-14f0def3f4bc",
  "type": "image",
  "result_url": "https://cdn.piapi.ai/generated/image.png"
}
```

**Response Example**:
```json
{
  "status": "success",
  "message": "Content downloaded successfully",
  "task_id": "12e8d550-b639-437f-b0af-14f0def3f4bc",
  "type": "image",
  "filename": "image_12e8d550-b639-437f-b0af-14f0def3f4bc_2024-06-23T10-00-30-000Z.png",
  "storage_path": "/piapi-content/image/2024-06-23/image_12e8d550-b639-437f-b0af-14f0def3f4bc_2024-06-23T10-00-30-000Z.png",
  "download_timestamp": "2024-06-23T10:00:35Z"
}
```

### 3. Advanced Models Workflow (`piapi-advanced-models.json`)

**Endpoint**: `POST /webhook/piapi-advanced`

**Supported Models**:
- **flux-pro**: Professional quality images with advanced settings
- **flux-dev**: Development version for testing
- **midjourney**: Midjourney-style generation
- **kling**: Kling video generation
- **llm**: Large language model text generation

**Request Examples**:

**Flux Pro**:
```json
{
  "model_type": "flux-pro",
  "prompt": "professional product photography",
  "width": 1024,
  "height": 1024,
  "guidance_scale": 7.5,
  "steps": 50
}
```

**Midjourney**:
```json
{
  "model_type": "midjourney",
  "prompt": "fantasy landscape --ar 16:9 --s 100",
  "aspect_ratio": "16:9",
  "stylize": 100,
  "quality": 1
}
```

**Kling Video**:
```json
{
  "model_type": "kling",
  "prompt": "smooth camera movement through forest",
  "duration": 5,
  "aspect_ratio": "16:9"
}
```

## File Storage Structure

Generated content is automatically organized:

```
/piapi-content/
├── image/
│   ├── 2024-06-23/
│   │   ├── image_[task_id]_[timestamp].png
│   │   └── ...
│   └── 2024-06-24/
├── music/
│   ├── 2024-06-23/
│   │   ├── music_[task_id]_[timestamp].mp3
│   │   └── ...
│   └── ...
├── video/
│   └── 2024-06-23/
│       ├── video_[task_id]_[timestamp].mp4
│       └── ...
```

## Polling Configuration

The polling system is configurable:

- **Default interval**: 5000ms (5 seconds)
- **Max attempts**: 30 (2.5 minutes total)
- **Status checks**: pending → processing → completed/failed

## Error Handling

All workflows include comprehensive error handling:

1. **Task Creation Errors**: Invalid parameters, API key issues
2. **Polling Timeout**: Max attempts reached without completion
3. **Download Errors**: Network issues, invalid URLs
4. **Storage Errors**: Disk space, permissions

## Testing

Use the provided test script:

```bash
cd scripts
./test-advanced-workflows.sh
```

This will test:
- Complete workflow with polling
- All content types (image, music, video)
- Advanced model support
- Download functionality

## Next Steps

1. **Database Integration**: Store task results in database
2. **User Authentication**: Add user-specific generation tracking
3. **Webhook Notifications**: Send completion notifications
4. **Batch Processing**: Handle multiple generations
5. **Analytics Dashboard**: Track usage and performance

## API Rate Limits

Remember PiAPI rate limits:
- Requests per second: Check PiAPI documentation
- Concurrent tasks: Limited by plan
- Storage: Ensure adequate disk space

## Troubleshooting

### Workflow Not Triggering
1. Check webhook is active in n8n
2. Verify endpoint URL is correct
3. Check n8n logs for errors

### Polling Never Completes
1. Increase max_attempts if needed
2. Check PiAPI task status manually
3. Verify API key is valid

### Download Failures
1. Ensure storage directory exists
2. Check file permissions
3. Verify result_url is accessible

## Support

For issues or questions:
1. Check n8n logs: `tail -f logs/n8n.log`
2. Review GitHub issues
3. Test with simple prompts first
4. Verify PiAPI account status