#!/bin/bash

docker build -t monitoring_collector .
docker stack deploy monitoring -c monitoring.yml
docker stack deploy visualizer -c visualizer_swarm.yml