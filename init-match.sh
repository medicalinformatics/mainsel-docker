#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-anjou}
REMOTE_SITE=${2:-bapu}
echo "Info: Initiating matching between ${SITE} and ${REMOTE_SITE}"
docker-compose -p ${SITE} exec mainzelliste curl -s http://localhost:8080/Communicator/matchMN/trigger/${REMOTE_SITE}
