FROM ubuntu

RUN apt-get -y update && apt -y install nginx supervisor
RUN apt -y install php php-cli php-fpm

COPY default /etc/nginx/sites-available/default
COPY htmldir /usr/share/nginx/html
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80/tcp

CMD ["/usr/bin/supervisord"]
