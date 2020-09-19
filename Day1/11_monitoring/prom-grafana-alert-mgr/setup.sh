docker network create monitoring
docker container run -d --network monitoring --name my-prometheus -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -p 9090:9090 prom/prometheus
docker container run --network monitoring -d -p 3000:3000 --name grafana grafana/grafana:6.5.0
