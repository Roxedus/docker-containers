#!/usr/bin/with-contenv bash
if [[ ! -d /config/config.py ]]; then
    echo "First run"
    touch /config/config.py
    ln -sf /config/config.py /app/config.py
    mkdir /config/logs
    mkdir /config/output
fi
ln -sf /config/logs /app/logs
ln -sf /config/output /app/output