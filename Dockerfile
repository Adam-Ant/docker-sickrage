FROM alpine:3.4
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

ENV UID=439 UNAME=sickrage GID=990 GNAME=media

ADD start.sh /start.sh

RUN chmod +x /start.sh \
 && addgroup -g $GID $GNAME \
 && adduser -SH -u $UID -G $GNAME -s /usr/sbin/nologin $UNAME \
 && apk add --no-cache ca-certificates \
        py-pip ca-certificates git python py-libxml2 py-lxml \
        make gcc g++ python-dev openssl-dev libffi-dev unrar \
 && pip --no-cache-dir install pyopenssl cheetah requirements \
 && apk del --no-cache make gcc g++ python-dev \
 && mkdir /sickrage && chown $UID:$GID /sickrage

USER $UNAME

RUN git clone --depth 1 https://github.com/SickRage/SickRage.git /sickrage

VOLUME ["/config", "/media"]
EXPOSE 8081
CMD ["/start.sh"]
