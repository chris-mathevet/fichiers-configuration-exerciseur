#!/bin/bash
kubectl create namespace openfaas-fn || true
kubectl create namespace openfaas || true

# kubectl apply -f function-network.yaml
kubectl apply -f basic-auth-config.yaml
kubectl apply -f basic-auth-secret.yaml
kubectl apply -f service-account.yaml

# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update:contentReference[oaicite:31]{index=31}

# helm install prometheus prometheus-community/prometheus --namespace openfaas --create-namespace
kubectl apply -f prometheus.yaml

kubectl apply -f faas-netes.yaml
kubectl apply -f nats.yaml
kubectl apply -f queue-worker.yaml
kubectl apply -f basic-auth.yaml
kubectl apply -f gateway.yaml
kubectl apply -f faas-idler.yaml

# kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/yaml/prometheus.yml
