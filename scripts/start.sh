#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$SCRIPT_DIR/build-docker.sh $1
$SCRIPT_DIR/run-docker.sh $1
$SCRIPT_DIR/exec-docker.sh $1 $2
