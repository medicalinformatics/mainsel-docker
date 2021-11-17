IF "%1"=="" (set SITE=anjou) ELSE (set SITE=%1)
IF "%2"=="" (set NUMBER=) ELSE (set NUMBER=-l %2)
docker run --network %SITE%_intranet -v %cd%\test-data\:/data docker.verbis.dkfz.de/cord/mainzelliste-benchmark ADD_PATIENT -i "/data/gotthard_%SITE%.csv" -c "/data/transformation.csv.rules" -t "CSV" -k "testApi" -u "http://mainzelliste:8080" %NUMBER%
