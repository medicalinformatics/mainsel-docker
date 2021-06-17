#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
echo "Info: Requesting current status of jobs on $SITE";
docker exec "$SITE"_mainzelliste_1 curl -s http://secureepilinker:8161/jobs/list;
