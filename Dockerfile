FROM ghcr.io/zaproxy/zaproxy:stable

# Switch to root to set up files
USER root

# Copy entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Create ZAP config directory
RUN mkdir -p /home/zap/.ZAP && chown -R zap:zap /home/zap/.ZAP

# Switch back to zap user
USER zap

# Expose API port
EXPOSE 8090

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=3 \
    CMD curl -sf "http://127.0.0.1:8090/JSON/core/view/version/" || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
