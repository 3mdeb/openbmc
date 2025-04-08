#!/usr/bin/env bash

# Default image path
DEFAULT_IMAGE="./build/x11ssh/tmp/deploy/images/x11ssh/obmc-phosphor-image-x11ssh.static.mtd"

# Use the first argument as image path if provided, else use default
IMAGE_PATH="${1:-$DEFAULT_IMAGE}"

# Check if the file exists
if [ ! -f "$IMAGE_PATH" ]; then
  echo "Error: File '$IMAGE_PATH' not found."
  exit 1
fi

# Run QEMU with the verified image
qemu-system-arm -machine supermicrox11-bmc \
  -drive file="$IMAGE_PATH",format=raw,if=mtd \
  -m 256 \
  -nographic \
  -net nic \
  -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=udp:127.0.0.1:2623-:623,hostname=qemu
