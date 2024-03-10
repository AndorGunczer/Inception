FROM debian:buster

RUN apt-get update -y

RUN apt-get install mariadb-server mariadb-client -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/script.sh script.sh
RUN chmod +x ./script.sh

# # TESTING
# # RUN apt-get install net-tools iputils-ping -y

ENTRYPOINT ["./script.sh"]