#!/bin/bash

set -e

if [ $# -eq 0 ]; then
  echo "Usage: $0 <host-path-to-mount>"
  exit 1
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Path '$DIRECTORY' does not exist or is not a directory."
  exit 1
fi

BASENAME=$(basename "$DIRECTORY")

CONTAINER_NAME="ai-agent-$BASENAME"

if [[ "$(docker ps -aq -f name=^${CONTAINER_NAME}$)" == "" ]]; then
  echo "Container $CONTAINER_NAME not found. Creating and starting..."
  docker run \
    -d \
    --name $CONTAINER_NAME \
    --volume "$DIRECTORY:/app" \
    --volume "$HOME/.codex/auth.json:/root/.codex/auth.json" \
    ai-agent
else
  # Check if it's stopped
  if [[ "$(docker ps -q -f name=^${CONTAINER_NAME}$)" == "" ]]; then
    echo "Container $CONTAINER_NAME exists but is stopped. Starting..."
    docker start $CONTAINER_NAME
  else
    echo "Container $CONTAINER_NAME is already running."
  fi
fi
