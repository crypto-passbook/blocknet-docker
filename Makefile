BLOCKNETDX_DIR ?= $(HOME)/.blocknetdx
CONF_FILE ?= $(PWD)/blocknetdx.conf

default: build

check-docker:
	@echo "Checking docker version..."
	docker version 

build: check-docker
	docker build -t blocknetdx .

run:
	@echo "Running blocknetdx in docker"
	@if [ ! -d $(BLOCKNETDX_DIR) ]; then echo "first time setup"; mkdir -p $(BLOCKNETDX_DIR); cp $(CONF_FILE) $(BLOCKNETDX_DIR)/blocknetdx.conf; fi
	docker run -d -v "$(BLOCKNETDX_DIR):/root/.blocknetdx" --name blocknetdx blocknetdx

stop:
	docker rm -f blocknetdx