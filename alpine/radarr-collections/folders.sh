#!/usr/bin/with-contenv bash
if [[ ! -f /config/words.conf ]]; then
    echo "First run, cloning config into /config"
    mv /app/config/* /config
    ln -sf /config /app
else
    ln -sf /config /app
fi
chown -R root:root /config
chmod -R 777 /config