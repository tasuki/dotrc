#!/bin/bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
	echo "Usage: $0 <remote-port>" >&2
	echo "Error: missing required remote port argument" >&2
	exit 1
fi

REMOTE_PORT=$1
SERVICE_NAME="ssh-tunnel.service"
SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/$SERVICE_NAME"

mkdir -p "$SERVICE_DIR"

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Reverse SSH tunnel
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/usr/bin/ssh -N \
	-o BatchMode=yes \
	-o ExitOnForwardFailure=yes \
	-o ServerAliveInterval=30 \
	-o ServerAliveCountMax=3 \
	-R ${REMOTE_PORT}:localhost:678 \
	vita@tasuki.org
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now "$SERVICE_NAME"
sudo loginctl enable-linger "$(id -un)"
