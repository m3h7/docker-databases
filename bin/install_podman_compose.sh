#!/usr/bin/env bash
# Installs latest podman-compose

curl -o ~/.local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/devel/podman_compose.py
chmod +x ~/.local/bin/podman-compose
ln -sf podman-compose ~/.local/bin/pc
