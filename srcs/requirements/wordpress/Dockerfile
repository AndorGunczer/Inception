FROM debian:buster

RUN apt-get update -y
RUN apt install wget gnupg -y

# Installing required packages for php7.4 installation

RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# PHP7.4 and PHP7.4 modules installation
RUN apt update -y
RUN apt -y install php7.4
RUN apt-get -y install php7.4-cli php7.4-fpm php7.4-mysql php7.4-json php7.4-opcache php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl

# Wordpress installation
RUN cd /var/www/html && wget http://wordpress.org/latest.tar.gz && tar xfz latest.tar.gz && mv wordpress/* ./ && rm -f latest.tar.gz && rm index.html

EXPOSE 9000

# copying script to container and executing it

# COPY tools/setup.sh /
# RUN chmod +x /setup.sh
# ENTRYPOINT ["sh", "/setup.sh"]
