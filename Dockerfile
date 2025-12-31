ARG BASE=selenium/standalone-chrome:4.39.0-20251202
FROM ${BASE}

USER root

RUN apt update && apt install curl git -y \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt install nodejs -y

RUN wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz \
    && rm go1.23.4.linux-amd64.tar.gz

RUN cat <<EOF >> /etc/supervisor/conf.d/selenium.conf
[program:remote-selenium-mcp]
priority=20
command=bash -c "nohup node /home/seluser/supergateway/dist/index.js --stdio '/home/seluser/vibium/clicker/bin/clicker mcp -v' --outputTransport streamableHttp --stateful --sessionTimeout 60000 --port 8000 > /tmp/supergateway.log 2>&1 &"
stopasgroup = true
autostart=true
autorestart=false
startsecs=0
startretries=0
EOF

EXPOSE 7900
EXPOSE 8000

USER ${SEL_UID}

ENV SE_VNC_NO_PASSWORD=true
ENV SE_VNC_VIEW_ONLY=true

RUN bash -c "cd /home/seluser && git clone https://github.com/VibiumDev/vibium.git"
# WORKAROUND
RUN sed -i '221s/case "initialized":/case "initialized", "notifications\/initialized":/' /home/seluser/vibium/clicker/internal/mcp/server.go
RUN bash -c "cd /home/seluser/vibium/clicker && /usr/local/go/bin/go build -o bin/clicker ./cmd/clicker"
RUN bash -c "cd /home/seluser/vibium/clicker && ./bin/clicker install"

RUN bash -c "cd /home/seluser && git clone https://github.com/supercorp-ai/supergateway.git && cd /home/seluser/supergateway && npm i && npm run build"
