#!/bin/bash

domain=$1

if [ $# -lt 1 ]
then
    echo "Usage: ./myCRT.sh <DOMAIN_TARGET>)"
    exit 0
fi

curl "https://crt.sh/?q=%.${domain}&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > ${domain}_subdomains.txt &&
echo " Results stored in ${domain}_subdomains.txt..."