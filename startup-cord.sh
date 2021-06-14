#!/usr/bin/env bash
set -euo pipefail;
echo "Info: Sourcing trying to source .env file";
source ./.env;
SITE=${1:-anjou}
REMOTE_SITE=${2:-bapu}
if [ $SITE = anjou ]; then
	LOCAL_TUNNEL=$ANJOU_VPN_IP
fi
if [ $SITE = bapu ]; then
	LOCAL_TUNNEL=$BAPU_VPN_IP
fi
if [ $SITE = cynthia ]; then
	LOCAL_TUNNEL=$CYNTHIA_VPN_IP
fi
if [ $REMOTE_SITE = anjou ]; then
	REMOTE_TUNNEL=$ANJOU_VPN_IP
fi
if [ $REMOTE_SITE = bapu ]; then
	REMOTE_TUNNEL=$BAPU_VPN_IP
fi
if [ $REMOTE_SITE = cynthia ]; then
	REMOTE_TUNNEL=$CYNTHIA_VPN_IP
fi
echo "Info: Now starting party ${SITE} ready for connection with site ${REMOTE_SITE}";
docker-compose -f docker-compose.yml -p ${SITE} up -d;
