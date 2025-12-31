# Vibium Remote MCP

## Overview
Vibium Remote MCP provides a Docker-based solution to run **Vibium** remotely via a Streamable HTTP MCP. This eliminates the need for local installation of Vibium while exposing its functionality through the Supergateway service.

## Prerequisites
- Docker & Docker Compose installed
- Sufficient memory (recommended at least 2 GB)
- Network access to the desired remote IP address

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Build](#build)
- [Run](#run)
- [Configure](#configure)
- [Demo](#demo)
- [Repository Information](#repository-information)
- [Contributing](#contributing)
- [License](#license)

## Build
```sh
docker compose build
```

## Run
```sh
docker compose up -d
```

## Configure
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
- This project provides a Docker setup to run Vibium remotely via Streamable HTTP MCP, avoiding local installation.
- **Supergateway**: https://github.com/supercorp-ai/supergateway – used to expose Vibium.

## Contributing
Contributions are welcome! Please open issues or pull requests on the repository. Follow the standard GitHub workflow.

## License
This project is licensed under the MIT License.
