kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
helm repo add openfaas https://openfaas.github.io/faas-netes/
helm repo update

kubectl apply -f basic-auth-config.yaml
kubectl apply -f basic-auth-secret.yaml

helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set functionNamespace=openfaas-fn --set basic_auth=true --set generateBasicAuth=false

export OPENFAAS_URL=$(minikube ip):31112 # Uniquement sur minikube

# A faire dans le terminal
# echo toto | faas-cli login -g http://$OPENFAAS_URL -u toto --password-stdin

kubectl apply -f ingress-faas.yaml
kubectl apply -f ingress-prometheus.yaml