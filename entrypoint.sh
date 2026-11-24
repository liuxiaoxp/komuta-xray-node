#!/bin/sh
# Komuta sets PORT to the primary port's target. Default to 8080 when run locally.
export PORT=${PORT:-8080}
export UUID=${UUID:-3d18d7cc-fd5d-4793-acd0-ae245ff98829}
export WS_PATH=${WS_PATH:-/vpn}

envsubst < /etc/xray/config.json.template > /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
