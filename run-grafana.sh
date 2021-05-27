#!/usr/bin/env sh
# mkdir -p .data/prometheus
# sudo chown -R nobody .data

docker run \
  --restart=always -p 3000:3000 -it -d \
  --name=grafana \
  -e GF_AUTH_ANONYMOUS_ENABLED=true \
  -v $(pwd)/grafana/datasource-prom.yaml:/etc/grafana/provisioning/datasources/prom.yaml:ro \
  -v grafana-storage:/var/lib/grafana \
  --add-host prometheus:${HOST_PROMETHEUS} \
  grafana/grafana:latest

