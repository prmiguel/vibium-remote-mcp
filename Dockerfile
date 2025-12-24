ARG BASE=selenium/standalone-chrome:4.39.0-20251202
FROM ${BASE}

USER root

RUN apt update && apt install curl git -y \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt install nodejs -y \
    && npm install -g @angiejones/mcp-selenium \
    && chown -R 1200:1201 "/home/seluser/.npm"

RUN cat <<EOF >> /etc/supervisor/conf.d/selenium.conf
[program:remote-selenium-mcp]
priority=20
command=bash -c "nohup node /home/seluser/supergateway/dist/index.js --stdio 'npx -y @angiejones/mcp-selenium' --outputTransport streamableHttp --stateful --sessionTimeout 60000 --port 8000 > /tmp/supergateway.log 2>&1 &"
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

RUN bash -c "cd /home/seluser && git clone https://github.com/supercorp-ai/supergateway.git && cd /home/seluser/supergateway && npm i & npm run build"
