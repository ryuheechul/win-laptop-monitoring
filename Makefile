.PHONY: log-prom
log-prom:
	docker logs -f prometheus

.PHONY: log-grafana
log-grafana:
	docker logs -f grafana

.PHONY: run
run: run-prometheus run-grafana

.PHONY: run-prometheus
run-prometheus: 
	./run-prom.sh

.PHONY: run-grafana
run-grafana: 
	./run-grafana.sh

.PHONY: stop
stop: stop-grafana stop-prometheus

.PHONY: stop-prometheus
stop-prometheus:
	docker stop prometheus

.PHONY: stop-grafana
stop-grafana:
	docker stop grafana
