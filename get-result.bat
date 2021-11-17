IF "%1"=="" (set SITE=anjou) ELSE (set SITE=%1)
IF "%2"=="" (set REMOTE_SITE=bapu) ELSE (set REMOTE_SITE=%2)
echo "Info: Requesting result from compuation between %SITE% and %REMOTE_SITE%"
docker-compose -p %SITE% exec mainzelliste curl -s http://localhost:8080/Communicator/matchMN/status/%REMOTE_SITE%
