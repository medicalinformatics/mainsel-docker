#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
echo "Info: Requesting current status of jobs on $SITE";
docker-compose -p ${SITE} exec mainzelliste curl http://secureepilinker:8161/jobs/list
# docker run --rm --name mainsel-get-status --network ${SITE}_intranet mwendler/wget -q -O - --no-proxy http://secureepilinker:8161/jobs/list;
