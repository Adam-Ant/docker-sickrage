#! /bin/sh

mkdir -p /config/sickrage
mkdir -p /config/sickrage/cache

/usr/bin/python /sickrage/SickBeard.py --datadir=/config/sickrage --config=/config/sickrage/config.ini
