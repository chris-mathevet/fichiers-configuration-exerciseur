#!/bin/bash

docker stack deploy traefik -c traefik.yml 

docker stack deploy openfaas -c openfaas.yml 

docker stack deploy pcap_api -c pcap-api.yml 