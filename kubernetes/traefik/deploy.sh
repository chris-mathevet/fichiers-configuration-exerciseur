kubectl create namespace traefik || true

# kubectl apply -f https://raw.githubusercontent.com/traefik/traefik-helm-chart/v21.2.0/traefik/crds/crd-resources.yaml

helm repo add traefik https://helm.traefik.io/traefik
helm repo update

# Install Traefik Resource Definitions:
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.4/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml

# Install RBAC for Traefik:
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.4/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml

# helm install traefik-crds traefik/traefik-crds --namespace=traefik --create-namespace

helm install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  --set logs.general.level="DEBUG" \
  -f traefik-values.yaml  

