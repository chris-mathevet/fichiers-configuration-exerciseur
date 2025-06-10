#!/bin/bash
# chmod +x traefik/deploy.sh openfaas/deploy.sh # pcap-api/deploy.sh

# cd traefik
# ./deploy.sh
# cd ..
# cd openfaas
# ./deploy.sh
# cd ..

listeDir="traefik openfaas pcap-api"

for dir in $listeDir; do
  cd "$dir" || continue
  chmod +x ./deploy.sh
  ./deploy.sh
  cd ..
done