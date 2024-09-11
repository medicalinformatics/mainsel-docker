#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-proxy1}
echo "Info: Requesting current status of jobs on $SITE";
docker-compose exec mainzelliste curl -s http://sel:8161/jobs/list;
