#!/bin/bash

listeDir="traefik openfaas pcap-api"

for dir in $listeDir; do
  cd "$dir" || continue
  chmod +x ./delete.sh
  ./delete.sh
  cd ..
done

