#!/usr/bin/env bash
set -euo pipefail;
SITE=${1:-proxy1}
REMOTE_SITE=${2:-proxy2}
echo "Info: Initiating matching between ${SITE} and ${REMOTE_SITE}"
docker-compose exec mainzelliste curl -s http://localhost:8080/Communicator/matchMN/trigger/${REMOTE_SITE}
