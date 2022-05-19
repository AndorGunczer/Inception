FROM debian:buster

RUN apt-get update -y
RUN apt-get install nginx -y

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]