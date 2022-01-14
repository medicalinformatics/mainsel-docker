IF "%1"=="" (set SITE=anjou) ELSE (set SITE=%1)
echo "Info: Requesting current status of jobs on %SITE%"
docker-compose -p %SITE% exec mainzelliste curl -s http://secureepilinker:8161/jobs/list
