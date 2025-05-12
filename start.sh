#!/bin/bash

PROG=/usr/bin/mpd
USR=mpd
HOME=/var/lib/mpd
# PGID=1002
# PUID=1001
#AGID=$(stat -c %g /dev/snd/timer)
#

echo PGID:${PGID}
echo PUID:${PUID}
echo AGID:${AGID}

#groupdel audio
#groupadd -g ${AGID} audio
#RUN groupadd -g ${PGID} ${USER} \
#  && useradd -g ${PGID} -u ${PUID} -G ${USER} -M ${USER} -d $HOME \
#  && chown -R $USER:$USER $HOME \
#  && 
#usermod mpd -s /bin/bash
#chown -R mpd:audio /run/mpd
#exec su - mpd -c "${PROG} \"--no-daemon\" \"/etc/mpd.conf\""
# Debug
#exec su - mpd -c "${PROG} \"--stdout\" \"--no-daemon\" \"/etc/mpd.conf\""
#exec "/usr/bin/mpd --no-daemon /etc/mpd.conf"
 