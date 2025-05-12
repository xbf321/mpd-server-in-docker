FROM debian:latest

ENV \
  USER=mpd \
  GROUP=audio \
  HOME=/var/lib/mpd

COPY ./start.sh .
COPY ./mpd.conf /etc/mpd.conf.new
COPY ./debian.sources /etc/apt/sources.list.d/debian.sources
RUN apt update -y && apt upgrade -y && apt install -y mpd vim
RUN rm -rf /var/lib/apt/lists/*
RUN cp /etc/mpd.conf /etc/mpd.conf.backup\
  && mv /etc/mpd.conf.new /etc/mpd.conf \
  && mkdir -p /run/mpd \
  && touch /run/mpd/mpd.pid

#RUN groupadd ${USER} \
  #&& useradd -G ${USER} -M ${USER} -d $HOME \
RUN chown -R $USER:$GROUP $HOME \
  && chown -R $USER:$GROUP /run/mpd \
  && usermod $USER -s /bin/bash

RUN chmod +x start.sh

USER $USER
WORKDIR /var/lib/mpd
VOLUME /var/lib/mpd
EXPOSE 6600

CMD ["/usr/bin/mpd", "--no-daemon", "--stdout", "/etc/mpd.conf"]
#ENTRYPOINT ["/start.sh"]
