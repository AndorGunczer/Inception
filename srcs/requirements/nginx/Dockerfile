FROM debian:buster

RUN apt-get update -y
RUN apt-get install nginx -y

# COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]