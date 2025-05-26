echo "Starting Prometheus and Grafana monitoring stack..."
docker-compose up -d

echo "Waiting for services to initialize..."
sleep 10

echo "Monitoring stack is ready!"
echo "- Prometheus UI: http://localhost:9090"
echo "- Grafana UI: http://localhost:3000 (admin/admin)"