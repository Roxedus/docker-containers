FROM amd64/python:3.9-alpine

LABEL maintainer="Roxedus"

ENV args=-h

RUN \
    echo "**** install build dependencies ****" && \
    apk add --no-cache --virtual=build-dependencies \
        curl \
        jq && \
    echo "**** install runtime packages ****" && \
    pip install --no-cache-dir requests && \
    echo "**** install rcm ****" && \
    mkdir -p /app && \
    if [ -z ${COLLECTIONS_RELEASE+x} ]; then \
        COLLECTIONS_COMMIT=$(curl -sX GET https://api.github.com/repos/RhinoRhys/radarr-collections/commits/master \
        | jq -r '.sha' | cut -c1-8); \
    fi && \
    curl -o \
        /tmp/rcm.tar.gz -L \
        "https://github.com/RhinoRhys/radarr-collections/archive/${COLLECTIONS_COMMIT}.tar.gz" && \
    tar xf \
        /tmp/rcm.tar.gz -C \
        /app/ --strip-components=1 && \
    apk del --purge \
        build-dependencies && \
    rm -rf \
        /root/.cache \
        /tmp/*

COPY /folders.sh /run/folders.sh

CMD sh /run/folders.sh && python3 /app/rcm.py /config $args

VOLUME /config