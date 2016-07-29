FROM alpine:3.4

ADD ./start.sh /start.sh

RUN apk -U upgrade && \
    apk -U add \
        ca-certificates \
        py-pip ca-certificates git python py-libxml2 py-lxml \
        make gcc g++ python-dev openssl-dev libffi-dev unrar \
        && \
    pip --no-cache-dir install pyopenssl cheetah requirements && \
    adduser -S -u 439 -H -D -s /usr/sbin/nologin sickrage && \
    apk del make gcc g++ python-dev && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/* && \
    mkdir /sickrage && chown 439:439 /sickrage && \
    chmod u+x  /start.sh

USER sickrage
RUN git clone --depth 1 https://github.com/SickRage/SickRage.git /sickrage

VOLUME ["/config", "/media"]

EXPOSE 8081

CMD ["/start.sh"]
