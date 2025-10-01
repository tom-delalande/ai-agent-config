#!/bin/bash

IMAGE_NAME="ai-agent"

if [[ "$(docker images -q $IMAGE_NAME 2>/dev/null)" == "" ]]; then
  echo "Image $IMAGE_NAME not found. Building..."
  docker build -t $IMAGE_NAME . -f Dockerfile
else
  echo "Image $IMAGE_NAME already exists."
fi
