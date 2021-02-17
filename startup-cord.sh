#!/usr/bin/env bash
set -euo pipefail
SITE=${SITE:-teststandort}
docker-compose -f docker-compose.${SITE}.yml -f docker-compose.${SITE}.override.yml -p ${SITE} up -d
