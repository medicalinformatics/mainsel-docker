#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-proxy1}
REMOTE_SITE=${2:-proxy2}
echo "Info: Establishing connection between ${SITE} and ${REMOTE_SITE}"
docker compose exec mainzelliste curl -v -k "http://sel:8161/test/${REMOTE_SITE}"
