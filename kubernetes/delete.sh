#!/bin/bash
# kubectl delete namespace traefik
# kubectl delete namespace openfaas
# kubectl delete namespace openfaas-fn
# # helm repo remove openfaas
# helm repo remove traefik

listeDir="traefik openfaas pcap-api"

for dir in $listeDir; do
  cd "$dir" || continue
  chmod +x ./delete.sh
  ./delete.sh
  cd ..
done

