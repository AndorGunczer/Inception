FROM debian:buster

RUN apt-get update -y
RUN apt-get install nginx -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]