FROM amd64/python:3.6.8-alpine

LABEL maintainer="Roxedus"

RUN \
    echo "**** install build packages ****" && \
    python3 -m pip install requests && \
    apk add --no-cache git && \
    echo "**** Clonig project ****" && \
    git clone https://github.com/RhinoRhys/radarr-collections /app

VOLUME /config

CMD touch /config/config.py && ln -sf /config/config.py /app/config.py && python3 /app/rcm.py