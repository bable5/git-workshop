compose=docker-compose

run:
	$(compose) rm --force
	$(compose) build
	$(compose) up
