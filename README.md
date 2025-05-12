# MPD in docker

A docker image for [Music Player Daemon](https://www.musicpd.org/) based on debian

## How to use

First, create **mpd-server** directory. In this directory, create **music** and **playlists** directory.

```sh
cd mpd-server
mkdir music
mkdir playlists
```

### Docker

```
docker run -d --name mpd-server \
  -p 7160:6600/tcp \
  --cap-add=sys_nice \
  -v ./playlists:/var/lib/mpd/playlist:rw \
  -v ./music:/var/lib/mpd/music:rw \
  --device /dev/snd \
  xbf321/mpd-server
```

### Docker Compose

```
services:
  mpd-server:
    image: xbf321/mpd-server
    container_name: mpd-server
    restart: unless-stopped
    environment:
      - TZ=Asia/Hong_Kong
    volumes:
      - ./playlists:/var/lib/mpd/playlist:rw
      - ./music:/var/lib/mpd/music:rw
    ports:
      - 7160:6600
    devices:
      - /dev/snd:/dev/snd
    cap_add:
      - SYS_NICE
```

```sh
# stop
docker-compose down
# repull
docker-compose pull xbf321/home-print-web
# start
docker-compose up -d
```

## Other
```sh
#groupadd ${USER} \
#useradd -G ${USER} -M ${USER} -d $HOME \
#usermod $USER -s /bin/bash
#USER $USER
#groupadd -g ${PGID} ${USER}
#useradd -g ${PGID} -u ${PUID} -G ${USER} -M ${USER} -d $HOME
# chown -R $USER:$USER $HOME \
#usermod mpd -s /bin/bash
#CMD ["/usr/bin/mpd", "--no-daemon", "--stdout", "/etc/mpd.conf"]
docker run -it --rm xbf321/mpd-server /bin/bash
docker exec -it mpd-server /bin/bash
```