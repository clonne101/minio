#!ash  # Explicitly specify ash shell

PARENT_DIR := /root/minio-docker/
CHILD_DIR := /root/minio-docker/docker/

## start: Start minio container
start:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	chmod 666 /var/run/docker.sock; \
	docker-compose pull && docker compose up -d; \
	cd $(PARENT_DIR) || exit 1

## restart: Restart minio container
restart:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	chmod 666 /var/run/docker.sock; \
	docker-compose down && docker compose up -d; \
	cd $(PARENT_DIR) || exit 1

## stop: Stop minio container
stop:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	docker-compose stop; \
	cd $(PARENT_DIR) || exit 1

## logs: Tail minio container logs
logs:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	docker-compose logs -f; \
	cd $(PARENT_DIR) || exit 1

## show: Show minio containers
show:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	docker-compose ps; \
	cd $(PARENT_DIR) || exit 1

## clean: Clean minio containers and volumes (using implicit rule)
.PHONY: clean
clean:
	clear && . $(PARENT_DIR)ascii.sh "Minio"; \
	cd $(CHILD_DIR); \
	docker system prune -f; \
	cd $(PARENT_DIR) || exit 1

## help: Command to view help
help: Makefile
	clear && . $(PARENT_DIR)ascii.sh "Minio"
	@echo
	@echo "Choose a command (Alpine Linux ONLY):"
	@echo
	@echo "  start           : Start minio container"
	@echo "  restart         : Restart minio container"
	@echo "  stop            : Stop minio container"
	@echo "  logs            : Tail minio container logs"
	@echo "  show            : Show minio containers"
	@echo "  clean           : Clean minio containers and volumes"
	@echo "  help            : Show this help message"
	@echo 
