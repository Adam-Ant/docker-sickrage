[hub]: https://hub.docker.com/r/spritsail/sickrage
[git]: https://github.com/spritsail/sickrage
[drone]: https://drone.spritsail.io/spritsail/sickrage
[mbdg]: https://microbadger.com/images/spritsail/sickrage

# [spritsail/sickrage][hub]
[![Layers](https://images.microbadger.com/badges/image/spritsail/sickrage.svg)][mbdg]
[![Latest Version](https://images.microbadger.com/badges/version/spritsail/sickrage.svg)][hub]
[![Git Commit](https://images.microbadger.com/badges/commit/spritsail/sickrage.svg)][git]
[![Docker Stars](https://img.shields.io/docker/stars/spritsail/sickrage.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/spritsail/sickrage.svg)][hub]
[![Build Status](https://drone.spritsail.io/api/badges/spritsail/sickrage/status.svg)][drone]

Dockerfile for running the TV management and NZB searching tool SickRage. It expects a  volume to store data mapped to /config in the container, and a volume where your downloads should go stored at /media. Enjoy!

This Docker imagee assumes a default user/group id pair of 906:900. Make sure this user has write access to the /config folder.

## Example run command
```bash
docker run -d --restart=on-failure:10 --name sickrage -v /host/path/to/config:/config -p 8081:8081 spritsail/sickrage
```
