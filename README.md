# CORD Cookbook - Secure Record Linkage
This repository enables sites to deploy a Secure Record Linkage Party on their server.

## Getting Started

These instructions will get your site up and running.

``` sh
cp .env.default .env
```

You can keep the defaults or adjust them to fit your site.

``` sh
./startup-cord.sh
```

This will start the site "anjou" which will wait for a record linkage partner named "bapu".
The site name can be controlled with the "SITE" environment variable. The remote site can be controlled with the "REMOTE_SITE" variable.

## Connecting two local parties

First you must create a docker network which both parties can join:
``` sh
docker network create -d bridge smpc-network
```

Now you can add you single containers to this network

``` sh
docker network connect --alias <your-site-name>-sel smpc-network <your-site-name>_secureepilinker_1
```

You will need to repeat this command for all parties joining the computation.

## Triggering the linkage process

``` sh
docker exec anjou_mainzelliste_1 curl -v -k "http://secureepilinker:8161/test/bapu"
```

``` sh
docker exec anjou_mainzelliste_1 wget http://localhost:8080/Communicator/triggerMNMatch/bapu
```

## Adding Testdata to one mainzelliste

Importing the first 100 records into the Meinzelliste database. Omit ```-l 100``` parameter to import every record.

``` sh
docker run --network anjou_intranet -v "$(pwd)/test-data/":/data docker.verbis.dkfz.de/cord/mainzelliste-benchmark ADD_PATIENT -i "/data/A1_Person.csv" -c "/data/A1_Person.csv.rules" -t "CSV" -k "testApi" -u "http://mainzelliste:8080" -l 100
```
