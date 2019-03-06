#!/usr/bin/with-contenv bash
if [[ ! -f /config/config.py ]]; then
    echo "First run, cloning config.py into /config"
    cp /app/config.default.py /config/config.py
    ln -sf /config/config.py /app/config.py
else
    ln -sf /config/config.py /app/config.py
fi
if [[ ! -d /config/output ]]; then
    echo "Output directory not existing, creating"
    mkdir /config/output
    ln -sf /config/output /app
else
    ln -sf /config/output /app
fi
if [[ ! -d /config/logs ]]; then
    echo "Logs directory not existing, creating"
    mkdir /config/logs
    ln -sf /config/logs /app
else
    ln -sf /config/logs /app
fi

chown -R root:root \
    /config/logs \
    /config/output \
    /config/config.py
chmod -R 777 \
    /config/logs \
    /config/output \
    /config/config.py