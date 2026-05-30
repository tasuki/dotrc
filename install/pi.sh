#!/bin/bash
set -euo pipefail

# run this script, or if don't want to build:
# podman pull docker.io/tasuki/pi:latest
#
# push:
# podman push docker.io/tasuki/pi:latest
# podman push docker.io/tasuki/pi:$(date +%F)

SCRIPT_DIR=$(dirname "$(realpath "$0")")
podman build \
	-t "docker.io/tasuki/pi:$(date +%F)" \
	-t "docker.io/tasuki/pi:latest" \
	-f "$SCRIPT_DIR/containers/Containerfile.pi" "$SCRIPT_DIR/.."
mkdir -p ~/.pi/
