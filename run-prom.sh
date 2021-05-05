#!/usr/bin/env sh
# mkdir -p .data/prometheus
# sudo chown -R nobody .data

docker run \
  --rm -p 9090:9090 -it -d \
  --name=prometheus \
  --entrypoint=/usr/local/bin/entrypoint.sh \
  -v $(pwd)/prom/prometheus.yml:/etc/prometheus/prometheus.yml \
  -v $(pwd)/prom/container/bin/entrypoint.sh:/usr/local/bin/entrypoint.sh \
  -v prometheus:/prometheus \
  --add-host ohmgraphite:${HOST_OHMGRAPHITE} \
  prom/prometheus:latest
