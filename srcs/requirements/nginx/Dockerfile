FROM debian:buster

RUN apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

RUN rm /etc/nginx/sites-enabled/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# TESTING
# RUN apt-get install net-tools iputils-ping less -y

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=agunczer.42.fr"


CMD ["nginx", "-g", "daemon off;"]