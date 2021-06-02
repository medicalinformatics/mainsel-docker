#!/usr/bin/env bash
set -euo pipefail;
echo "Info: Sourcing trying to source .env file";
source ./.env;
echo "Info: Now starting party ${SITE} ready for connection with site ${REMOTE_SITE}";
docker-compose -f docker-compose.yml -p ${SITE} up -d;
