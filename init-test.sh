#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
REMOTE_SITE=${2:-bapu}
echo "Info: Establishing connection between ${SITE} and ${REMOTE_SITE}"
docker exec ${SITE}_mainzelliste_1 curl -v -k "http://secureepilinker:8161/test/${REMOTE_SITE}"
