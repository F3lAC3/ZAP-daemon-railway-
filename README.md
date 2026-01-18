# ZAP Daemon for Railway

OWASP ZAP security scanner configured for Railway deployment with proper API access controls.

## Features

- Based on official `ghcr.io/zaproxy/zaproxy:stable` image
- API access enabled for all IP addresses (required for Railway internal networking)
- API key authentication enabled
- Health check endpoint configured
- Memory optimized (2GB max, 1GB initial)

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `ZAP_API_KEY` | API key for authentication | `your-secure-api-key` |

## Railway Deployment

1. Connect this repo to Railway
2. Set environment variable: `ZAP_API_KEY=your-secure-api-key`
3. Deploy

## API Endpoints

- Health check: `GET /JSON/core/view/version/?apikey=YOUR_KEY`
- Start spider: `GET /JSON/spider/action/scan/?url=TARGET&apikey=YOUR_KEY`
- Start active scan: `GET /JSON/ascan/action/scan/?url=TARGET&apikey=YOUR_KEY`

## Connecting from Worker

Set these environment variables in your worker service:

```
ZAP_HOST=zap-daemon-railway.railway.internal
ZAP_PORT=8080
ZAP_API_KEY=your-secure-api-key
```

Replace `zap-daemon-railway` with your Railway service name.
