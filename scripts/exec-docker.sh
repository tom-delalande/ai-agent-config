#!/bin/bash

set -e

if [ $# -eq 1 ]; then
  echo "Usage: $0 <host-path-to-mount> <command>"
  exit 1
fi

DIRECTORY="$1"
COMMAND="$2"

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Path '$DIRECTORY' does not exist or is not a directory."
  exit 1
fi

BASENAME=$(basename "$DIRECTORY")

docker exec -it ai-agent-$BASENAME $COMMAND
