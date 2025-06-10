#!/bin/bash

INTERVAL=10  # Intervalle en secondes
PUSHGATEWAY_URL="http://pushgateway:9091"
JOB_NAME="openfaas_function_scale"

while true; do
  docker service ls --format '{{.ID}} {{.Name}}' | while read -r id name; do
    image=$(docker service inspect "$id" --format '{{.Spec.TaskTemplate.ContainerSpec.Image}}')

    if [[ "$image" == 127.0.0.1:5000/exerciseur:* ]]; then
      replicas=$(docker service ls --filter id="$id" --format '{{.Replicas}}' | cut -d/ -f1)
      echo "openfaas_function_replicas{function=\"$name\",image=\"$image\"} $replicas"
    fi
  done | curl --silent --data-binary @- "$PUSHGATEWAY_URL/metrics/job/$JOB_NAME"

  sleep "$INTERVAL"
done
