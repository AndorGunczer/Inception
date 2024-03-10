# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agunczer <agunczer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/20 12:20:28 by agunczer          #+#    #+#              #
#    Updated: 2024/02/29 15:54:46 by agunczer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

host = 127.0.0.1 agunczer.42.fr

# Execute with sudo

make-hosts:
	@if sudo grep '$(host)' /etc/hosts; then \
		echo "host already added"; \
	else \
		sudo echo $(host) >> /etc/hosts; \
	fi

all:
	docker compose -f ./srcs/docker-compose.yml up -d

fclean:
	sudo docker system prune --all --force --volumes
	sudo docker volume prune --force
	sudo docker network prune --force
	sudo docker volume rm `docker volume ls -q`
	sudo rm -rf /home/agunczer42fr/data/mariadb/*
	sudo rm -rf /home/agunczer42fr/data/wordpress/*
	sudo echo "MADE CLEAN"
	
fclean-macos:
	docker system prune --all --force --volumes
	docker volume prune --force
	docker network prune --force
	docker volume rm `docker volume ls -q`
	rm -rf /Users/agunczer42fr/data/mariadb/*
	rm -rf /Users/agunczer42fr/data/wordpress/*
	echo "MADE CLEAN"

down:
	sudo docker compose -f ./srcs/docker-compose.yml down
	
down-macos:
	docker compose -f ./srcs/docker-compose.yml down

up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d
	
up-macos:
	docker compose -f ./srcs/docker-compose.yml up -d

docker-info:
	sudo docker image ls
	sudo docker ps
	
docker-info-macos:
	docker image ls
	docker ps

reimage:
	sudo docker image rm -f mariadb
	sudo docker image rm -f nginx
	sudo docker compose -f ./srcs/docker-compose.yml up --remove-orphans

unimage:
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo docker image rm -f mariadb
	sudo docker image rm -f nginx
	
complete_re:
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo docker system prune -a
	sudo docker system prune --all --force --volumes
	sudo docker volume prune --force
	sudo docker network prune --force
	sudo docker compose -f ./srcs/docker-compose.yml up -d
	
complete_re-macos:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -a
	docker system prune --all --force --volumes
	docker volume prune --force
	docker network prune --force
	docker compose -f ./srcs/docker-compose.yml up -d