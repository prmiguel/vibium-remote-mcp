# Vibium Remote MCP
Vibium Remote MCP provides a Docker-based solution to run **Vibium** remotely through `Streamable HTTP`.

## Prerequisites
- Docker & Docker Compose installed
- Sufficient memory (recommended at least 2GB)
- Network access to the desired remote IP address

## Run
```sh
docker run -d \
  --name vibium-remote-mcp \
  -p 8000:8000 \
  -p 7900:7900 \
  --shm-size 2g \
  --cap-add CAP_SYS_ADMIN \
  --restart unless-stopped \
  ghcr.io/prmiguel/vibium-remote-mcp-chrome:main
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
- [Vibium](https://github.com/VibiumDev/vibium)
- [Supergateway](https://github.com/supercorp-ai/supergateway)
