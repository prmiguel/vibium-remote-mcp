# Vibium Remote MCP

Build
```sh
docker compose build
```

Run
```sh
docker compose up -d
```

Configure
```json
{
  "mcpServers": {
    "vibium-remote": {
      "url": "http://<remote-ip>:8000/mcp"
    }
  }
}
```