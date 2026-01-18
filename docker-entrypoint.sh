#!/bin/bash
set -e

echo "[ZAP] Starting ZAP daemon initialization..."

# Set API key from environment or use default
ZAP_API_KEY="${ZAP_API_KEY:-your-secure-api-key}"
echo "[ZAP] API key: ${ZAP_API_KEY:0:4}****"

# Set Java memory options
export JAVA_OPTS="-Xmx2g -Xms1g -XX:+UseG1GC"
echo "[ZAP] JAVA_OPTS: $JAVA_OPTS"

# Create ZAP config directory
mkdir -p /home/zap/.ZAP

# Write config file with API address permissions
echo "[ZAP] Writing API configuration..."
cat > /home/zap/.ZAP/config.xml << XMLEOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<config>
    <api>
        <key>${ZAP_API_KEY}</key>
        <disablekey>false</disablekey>
        <incerrordetails>true</incerrordetails>
        <addrs>
            <addr>
                <name>.*</name>
                <regex>true</regex>
                <enabled>true</enabled>
            </addr>
        </addrs>
    </api>
</config>
XMLEOF

echo "[ZAP] API access: allowing all addresses"
echo "[ZAP] Starting daemon on 0.0.0.0:8080..."

# Start ZAP daemon
exec zap.sh -daemon -host 0.0.0.0 -port 8080
