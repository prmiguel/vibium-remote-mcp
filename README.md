# Vibium Remote MCP

## Overview
Vibium Remote MCP provides a Docker-based solution to run **Vibium** remotely.

## Prerequisites
- Docker & Docker Compose installed
- Sufficient memory (recommended at least 2GB)
- Network access to the desired remote IP address

## Build
```sh
docker compose build
```

## Run
```sh
docker compose up -d
```

## Configure
### Cursor
```json
{
  "mcpServers": {
    "vibium-remote": {
      "url": "http://<remote-ip>:8000/mcp"
    }
  }
}
```

## Demo

🎬 **[GIF Demonstration (vibium-remote - Streamable HTTP)](https://prmiguel.github.io/media/990256e8-6d06-4d50-b5c3-d60a56e52e38.gif)**

## Repository Information
- **Vibium Repo**: https://github.com/VibiumDev/vibium
- **Supergateway**: https://github.com/supercorp-ai/supergateway
