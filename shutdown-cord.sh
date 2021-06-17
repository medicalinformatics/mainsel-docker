#!/usr/bin/env bash
set -euo pipefail

: ${ANJOU_VPN_IP=192.168.255.2};
: ${BAPU_VPN_IP=192.168.255.3};
: ${CYNTHIA_VPN_IP=192.168.255.4};

export SITE=${1:-anjou}
export REMOTE_SITE=${2:-bapu}

if [ -f "./.env" ]; then
    echo "Info: Sourcing trying to source .env file";
    source ./.env;
fi

if [ $SITE = anjou ]; then
	export LOCAL_TUNNEL=$ANJOU_VPN_IP
fi
if [ $SITE = bapu ]; then
	export LOCAL_TUNNEL=$BAPU_VPN_IP
fi
if [ $SITE = cynthia ]; then
	export LOCAL_TUNNEL=$CYNTHIA_VPN_IP
fi
if [ $REMOTE_SITE = anjou ]; then
	export REMOTE_TUNNEL=$ANJOU_VPN_IP
fi
if [ $REMOTE_SITE = bapu ]; then
	export REMOTE_TUNNEL=$BAPU_VPN_IP
fi
if [ $REMOTE_SITE = cynthia ]; then
	export REMOTE_TUNNEL=$CYNTHIA_VPN_IP
fi
echo "Info: Shutting down party ${SITE}";
docker-compose -f docker-compose.yml -p ${SITE} down;
