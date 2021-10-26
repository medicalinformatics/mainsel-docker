#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
echo "Info: Requesting current status of jobs on $SITE";
docker-compose -p $SITE exec mainzelliste curl -s http://secureepilinker:8161/jobs/list;
