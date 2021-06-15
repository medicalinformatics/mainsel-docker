#!/usr/bin/env bash
set -euo pipefail;

: ${ANJOU_VPN_IP=192.168.255.2};
: ${BAPU_VPN_IP=192.168.255.3};
: ${CYNTHIA_VPN_IP=192.168.255.4};

echo "Info: Sourcing trying to source .env file";
export SITE=${1:-anjou}
export REMOTE_SITE=${2:-bapu}
source ./.env;
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
echo "Debug: $SITE has LOCAL_TUNNEL=$LOCAL_TUNNEL"
echo "Debug: $REMOTE_SITE has REMOTE_TUNNEL=$REMOTE_TUNNEL"
echo "Info: Now starting party ${SITE} ready for connection with site ${REMOTE_SITE}";
docker-compose -f docker-compose.yml -p ${SITE} up -d;

docker exec "$SITE"_vpn_1 iptables -A INPUT -s 192.168.255.0/24 -i tun+ -j ACCEPT;
docker exec "$REMOTE_SITE"_vpn_1 iptables -A INPUT -s 192.168.255.0/24 -i tun+ -j ACCEPT;
