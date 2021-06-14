#!/bin/sh
SITE=${1:-anjou}
if [ $# -eq 2 ]; then
	NUMBER="-l ${2}"
else
	NUMBER=""
fi
docker run --network ${SITE}_intranet -v "$(pwd)/test-data/":/data docker.verbis.dkfz.de/cord/mainzelliste-benchmark ADD_PATIENT -i "/data/gotthard_${SITE}.csv" -c "/data/A1_Person.csv.rules" -t "CSV" -k "testApi" -u "http://mainzelliste:8080" ${NUMBER}
