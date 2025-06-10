# minikube mount /home/pacha/stage/code/pcap-api:/mnt/pcap-api

docker ps | grep minikube
# docker cp /home/pacha/stage/code/pcap-api 891b703ed7e1:/mnt/pcap-api
# docker cp /home/pacha/stage/volumeTemp 891b703ed7e1:/mnt/volumeTemp
kubectl describe pod pcap-api-deployment-779877d79c-9xrxt -n pcap-api