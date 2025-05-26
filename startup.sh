# Create a file called startup.sh in your project
#!/bin/bash
mkdir -p /var/lib/grafana/dashboards
cp /tmp/service.json /var/lib/grafana/dashboards/ || true
chown -R 472:472 /var/lib/grafana/dashboards
exec /run.sh