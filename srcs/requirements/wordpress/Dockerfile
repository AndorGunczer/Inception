FROM debian:buster

RUN apt-get update
RUN apt install -y apt-transport-https lsb-release ca-certificates wget 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list 

RUN apt-get update && apt-get install php7.4-fpm php7.4-mysql mariadb-client curl -y

# ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

# RUN cd /var/www/ && \
#     tar -xvf latest.tar.gz && \
#     rm -rf latest.tar.gz


EXPOSE 9000
COPY ./tools/wp_configure.sh /tmp/wp_configure.sh
RUN chmod +x /tmp/wp_configure.sh
WORKDIR /var/www/html/

# TESTING: net-tools enables netstat -tulpen port check and iputils-ping enables ping command
# for network and service testability
# RUN apt-get install net-tools iputils-ping less -y

ENTRYPOINT ["/tmp/wp_configure.sh"]

# wp config create --dbhost="mariadb" --dbname=wbdb --dbuser="wpuser" --prompt="Password123!" --allow-root
# 172.18.0.3