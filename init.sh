FROM grafana/grafana:latest

USER root

# Copy provisioning files first
COPY grafana/provisioning /etc/grafana/provisioning

# Create initialize script
RUN echo '#!/bin/bash\n\
mkdir -p /var/lib/grafana/dashboards\n\
cp -f /tmp/dashboards/* /var/lib/grafana/dashboards/ 2>/dev/null || true\n\
chown -R grafana:grafana /var/lib/grafana/dashboards\n\
chmod -R 755 /var/lib/grafana/dashboards\n\
exec /run.sh "$@"' > /usr/local/bin/init.sh && \
    chmod +x /usr/local/bin/init.sh

# Create temporary directory for dashboard files
RUN mkdir -p /tmp/dashboards

# Copy dashboard to temporary location
COPY grafana/dashboards/service.json /tmp/dashboards/

# Set entrypoint to our init script
ENTRYPOINT ["/usr/local/bin/init.sh"]