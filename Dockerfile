FROM jwilder/nginx-proxy:latest
MAINTAINER Fabien Herfray <herfray.fabien@gmail.com>

RUN apt-get update \
&& apt-get install curl -y -q \
&& apt-get clean \
&& rm -r /var/lib/apt/lists/* \
&& curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux \
&& chmod +x /usr/local/bin/ep \
&& apt-get remove curl -y -q

COPY nginx.tmpl /app/nginx.tmpl
COPY cors.conf /etc/nginx/cors.conf
COPY common /etc/nginx/vhost.d/common
COPY common_location /etc/nginx/vhost.d/common_location

VOLUME /etc/nginx/vhost.d
VOLUME /usr/share/nginx/html