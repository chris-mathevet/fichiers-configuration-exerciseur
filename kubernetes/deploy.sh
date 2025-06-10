#!/bin/bash

listeDir="traefik openfaas pcap-api"

for dir in $listeDir; do
  cd "$dir" || continue
  chmod +x ./deploy.sh
  ./deploy.sh
  cd ..
done