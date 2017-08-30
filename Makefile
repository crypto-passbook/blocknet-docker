BLOCKNETDX_DIR ?= $(HOME)/.blocknetdx
CONF_FILE ?= $(PWD)/blocknetdx.conf

default: build

check-docker:
	@echo "Checking docker version..."
	docker version 

build: check-docker
	docker build -t blocknetdx .

run-server:
	@echo "Running blocknetdx in docker"
	@mkdir -p $(BLOCKNETDX_DIR)
	@cp $(CONF_FILE) $(BLOCKNETDX_DIR)/
	docker run -d -v "$(BLOCKNETDX_DIR):/root/.blocknetdx" --name blocknetdx blocknetdx

stop-server:
	docker rm -f blocknetdx