#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
REMOTE_SITE=${2:-bapu}
echo "Info: Requesting result from compuation between $SITE and $REMOTE_SITE";
docker exec "$SITE"_mainzelliste_1 curl -s http://localhost:8080/Communicator/matchMN/status/"$REMOTE_SITE";
