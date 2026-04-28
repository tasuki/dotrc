#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
podman build \
	-t "docker.io/tasuki/pi:$(date +%F)" \
	-t "docker.io/tasuki/pi:latest" \
	-f Containerfile.pi "$SCRIPT_DIR/containers/"
mkdir -p ~/.pi/
