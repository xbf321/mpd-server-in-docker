docker run \
  -e PUID=1001 \
  -e PGID=1002 \
  -p 7170:6600/tcp \
  -v /opt/x/web/english-mpd-server/playlists:/var/lib/mpd/playlist \
  -v /opt/x/web/english-mpd-server/music:/var/lib/mpd/music \
  --device /dev/snd \
  xbf321/mpd-server

docker run -it --rm xbf321/mpd-server /bin/bash

docker run --name mpd \
  -e PUID=1001 \
  -e PGID=1002 \
  -p 7170:6600/tcp \
  -v /Users/xingbaifang/Project/docker-test/playlists:/var/lib/mpd/playlist \
  -v /Users/xingbaifang/Project/docker-test/music:/var/lib/mpd/music \
  xbf321/mpd-server

  docker exec -it mpd /bin/bash