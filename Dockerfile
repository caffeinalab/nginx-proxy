FROM jwilder/nginx-proxy:latest
MAINTAINER Fabien Herfray <herfray.fabien@gmail.com>

COPY nginx.tmpl /app/nginx.tmpl
COPY cors.conf /app/cors.conf
COPY common /etc/nginx/vhost.d/common
COPY common_location /etc/nginx/vhost.d/common_location

VOLUME /etc/nginx/vhost.d