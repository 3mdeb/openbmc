#!/usr/bin/env bash

qemu-system-arm -machine supermicrox11-bmc \
  -drive file=./build/x11ssh/tmp/deploy/images/x11ssh/obmc-phosphor-image-x11ssh.static.mtd,format=raw,if=mtd \
  -m 256 \
  -nographic \
  -net nic \
  -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=udp:127.0.0.1:2623-:623,hostname=qemu
