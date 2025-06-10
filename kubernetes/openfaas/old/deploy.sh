#!/bin/bash
kubectl create namespace openfaas-fn || true

helm repo add openfaas https://openfaas.github.io/faas-netes/
helm repo update

helm install openfaas openfaas/openfaas \
  --namespace openfaas \
  --create-namespace \
  --set functionNamespace=openfaas-fn \
  --set generateBasicAuth=true \
  -f openfaas-values.yaml \
  --set gateway.ingress.enabled=true \
  --set gateway.ingress.annotations."kubernetes\.io/ingress.class"=traefik \
  --set basic_auth=true