#!/usr/bin/env bash
set -euo pipefail
echo "nachname;vorname;geburtsname;geburtsjahr;geburtsmonat;geburtstag;ort;plz"
awk -F ";" 'NR>2 {split($7,array,"-");print $3 FS $4 FS $5 FS array[1] FS array[2] FS array[3] FS $8 FS $9 }' $1
