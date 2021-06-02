#!/usr/bin/env bash
set -euo pipefail
echo "Info: Sourcing trying to source .env file";
source ./.env;
echo "Info: Shutting down party ${SITE}";
docker-compose -f docker-compose.yml -p ${SITE} down;
