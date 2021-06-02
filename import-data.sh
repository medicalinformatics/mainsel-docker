#!/bin/sh

docker run --network anjou_intranet -v "$(pwd)/test-data/":/data docker.verbis.dkfz.de/cord/mainzelliste-benchmark ADD_PATIENT -i "/data/A1_Person.csv" -c "/data/A1_Person.csv.rules" -t "CSV" -k "testApi" -u "http://mainzelliste:8080" -l 100
