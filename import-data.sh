#!/bin/sh
docker run --rm --network beamsel_intranet -v "$(pwd)/test-data/":/data docker.verbis.dkfz.de/cord/mainzelliste-benchmark ADD_PATIENT -i "/data/gotthard_anjou.csv" -c "/data/transformation.csv.rules" -t "CSV" -k "apiKey" -u "http://mainzelliste:8080"
