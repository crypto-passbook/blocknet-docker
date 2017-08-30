CONF_FILE ?= $(PWD)/blocknetdx.conf

default: build

check-docker:
	@echo "Checking docker version..."
	docker version 

build: check-docker
	docker build -t blocknetdx .

run-server:
	@echo "Running blocknetdx in docker"
	docker run -d -v "$(CONF_FILE):/root/.blocknetdx/blocknetdx.conf" --name blocknetdx blocknetdx

stop-server:
	docker rm -f blocknetdx