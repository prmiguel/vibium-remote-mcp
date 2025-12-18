# Selenium Remote MCP

Build
```sh
docker build -t selenium-remote-mcp .
```

Run
```sh
docker run -d -p 8000:8000 -p 7900:7900 selenium-remote-mcp
```

Configure
```json
{
  "mcpServers": {
    "selenium-remote": {
      "url": "http://<remote-ip>:8000/mcp"
    }
  }
}
```