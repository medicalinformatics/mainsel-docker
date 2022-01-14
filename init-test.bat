IF "%1"=="" (set SITE=anjou) ELSE (set SITE=%1)
IF "%2"=="" (set REMOTE_SITE=bapu) ELSE (set REMOTE_SITE=%2)
echo "Info: Establishing connection between %SITE% and %REMOTE_SITE%"
docker-compose -p %SITE% exec mainzelliste curl -v -k "http://secureepilinker:8161/test/%REMOTE_SITE%"
