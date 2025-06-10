kubectl create namespace traefik || true

helm repo add traefik https://helm.traefik.io/traefik
helm repo update

kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.4/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml

kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.4/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml

helm install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  --set logs.general.level="DEBUG" \
  -f traefik-values.yaml  

