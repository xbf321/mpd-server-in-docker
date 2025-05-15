FROM debian:latest

ENV \
  USER=mpd \
  GROUP=audio \
  HOME=/var/lib/mpd

COPY ./start.sh .
COPY ./mpd.conf /etc/mpd.conf.new
COPY ./asound.conf /etc/asound.conf
RUN apt update -y && apt upgrade -y && apt install -y mpd mpc vim
RUN rm -rf /var/lib/apt/lists/*
RUN cp /etc/mpd.conf /etc/mpd.conf.backup\
  && mv /etc/mpd.conf.new /etc/mpd.conf \
  && mkdir -p /run/mpd \
  && touch /run/mpd/mpd.pid

RUN chown -R $USER:$GROUP $HOME \
  && chown -R $USER:$GROUP /run/mpd

RUN chmod +x start.sh

WORKDIR /var/lib/mpd
VOLUME /var/lib/mpd
EXPOSE 6600

ENTRYPOINT ["/start.sh"]
