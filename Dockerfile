FROM spritsail/alpine:3.8

ARG SICKRAGE_VER=v2018.07.21-1

LABEL maintainer="Spritsail <sickrage@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Sickrage" \
      org.label-schema.url="https://sickrage.github.io" \
      org.label-schema.description="Automatic Video Library Manager for TV Shows" \
      org.label-schema.version=${SICKRAGE_VER} \
      io.spritsail.version.sickrage=${SICKRAGE_VER}

ENV SUID=906 SGID=900

WORKDIR /sickrage

RUN apk add --no-cache \
        python python-dev py-pip py-libxml2 py-lxml \
        ca-certificates curl make gcc g++ openssl-dev libffi-dev unrar \
 && pip --no-cache-dir install pyopenssl cheetah requirements \
 && curl -fL https://github.com/Sickrage/Sickrage/archive/${SICKRAGE_VER}.tar.gz \
        | tar xz --strip-components=1 \
 && find -name 'tests' -type d | xargs rm -rf \
 && chmod 777 . \
    \
 && apk del --no-cache make curl gcc g++ python-dev py-pip openssl-dev libffi-dev

VOLUME ["/config", "/media"]
EXPOSE 8081

ENTRYPOINT ["/sbin/tini", "--", "/sbin/su-exec", "--env"]
CMD [ "/usr/bin/python", "/sickrage/SickBeard.py", "--datadir=/config", "--config=/config/config.ini" ]
