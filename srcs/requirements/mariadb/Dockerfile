FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

# LABEL version="1.0"
# LABEL description="MariaDB Server"

# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1

# CMD ["sudo", "systemctl", "start", "mariadb.service"]

RUN /etc/init.d/mysql start

CMD ["mysqld"]