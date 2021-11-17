IF "%ANJOU_VPN_IP%"=="" (set ANJOU_VPN_IP=192.168.255.2)
IF "%BAPU_VPN_IP%"=="" (set BAPU_VPN_IP=192.168.255.3)
IF "%CYNTHIA_VPN_IP%"=="" (set CYNTHIA_VPN_IP=192.168.255.4)

IF "%1"=="" (set SITE=anjou) ELSE (set SITE=%1)
IF "%2"=="" (set REMOTE_SITE=bapu) ELSE (set REMOTE_SITE=%2)

IF %SITE%==anjou (set LOCAL_TUNNEL=%ANJOU_VPN_IP%)
IF %SITE%==bapu (set LOCAL_TUNNEL=%BAPU_VPN_IP%)
IF %SITE%==cynthia (set LOCAL_TUNNEL=%CYNTHIA_VPN_IP%)
IF %REMOTE_SITE%==anjou (set REMOTE_TUNNEL=%ANJOU_VPN_IP%)
IF %REMOTE_SITE%==bapu (set REMOTE_TUNNEL=%BAPU_VPN_IP%)
IF %REMOTE_SITE%==cynthia (set REMOTE_TUNNEL=%CYNTHIA_VPN_IP%)
echo "Debug: %SITE% has LOCAL_TUNNEL=%LOCAL_TUNNEL%"
echo "Debug: %REMOTE_SITE% has REMOTE_TUNNEL=%REMOTE_TUNNEL%"
echo "Info: Now starting party %SITE% ready for connection with site %REMOTE_SITE%"
docker-compose -f docker-compose.yml -p %SITE% up -d

docker-compose -p %SITE% exec vpn iptables -A INPUT -s 192.168.255.0/24 -i tun+ -j ACCEPT
