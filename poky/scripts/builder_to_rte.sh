#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "This script copies latest build openbmc image to rte."
    echo "Usage: $0 <target_ip> [--suffix <suffix>]"
    exit 1
}

# --- Check if 'builder' exists in /etc/hosts ---
if ! grep -qw "builder" /etc/hosts; then
    echo "Error: 'builder' is not defined in /etc/hosts"
    exit 1
fi

# --- Parse arguments ---
SUFFIX=""
TARGET_IP=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --suffix)
            shift
            [[ $# -gt 0 ]] || usage
            SUFFIX="$1"
            ;;
        -*)
            usage
            ;;
        *)
            TARGET_IP="$1"
            ;;
    esac
    shift
done

if [[ -z "$TARGET_IP" ]]; then
    usage
fi

# --- Variables ---
SRC_PATH="builder@builder:/project-data/$USER/openbmc/build/x11ssh/tmp/deploy/images/x11ssh/obmc-phosphor-image-x11ssh.static.mtd"
DEST_FILENAME="obmc-phosphor-image-x11ssh${SUFFIX:+_$SUFFIX}.static.mtd"
DEST_PATH="/data/test_images/$DEST_FILENAME"
DEST="root@${TARGET_IP}:${DEST_PATH}"

# --- Perform scp ---
scp "$SRC_PATH" "$DEST"

# --- Print destination ---
echo "Image copied to: $DEST_PATH"

