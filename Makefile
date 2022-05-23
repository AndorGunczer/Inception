all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

# clean:
# 	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all
# 	sudo docker system prune -a | yes | head -n 1

# fclean: clean

# re: fclean all

nginx:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

wordpress:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

db:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

ls:
	sudo docker image ls
	sudo docker ps

reimage:
	sudo docker image rm -f srcs_mariadb
	sudo docker image rm -f srcs_nginx
	sudo docker compose -f ./srcs/docker-compose.yml up