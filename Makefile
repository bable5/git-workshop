#DOCKER=fig
DOCKER=docker-compose

run:
	$(DOCKER) rm --force
	$(DOCKER) build
	$(DOCKER) up
