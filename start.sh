#!/bin/bash

PROG=/usr/bin/mpd
USR=mpd
GROUP=audio
AGID=$(stat -c %g /dev/snd/timer)

echo AGID:${AGID}

echo 'Start changing /dev/snd permistion'
chown -R $USR:$GROUP /dev/snd

exec $PROG --no-daemon --stdout
 