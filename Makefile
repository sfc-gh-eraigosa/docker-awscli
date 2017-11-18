SHELL := /bin/bash
APP_ROOT ?= $(shell pwd)
VERSION ?= $(shell cat "$(APP_ROOT)/VERSION")
DOCKER_IMAGE ?= wenlock/awscli
TRAVIS_BRANCH ?=
DOCKER_USERNAME ?=
DOCKER_PASSWORD ?=

ifneq ($(http_proxy),)
	BUILD_ARGS := $(BUILD_ARGS) --build-arg http_proxy=$(http_proxy)
endif
ifneq ($(https_proxy),)
	BUILD_ARGS := $(BUILD_ARGS) --build-arg https_proxy=$(http_proxy)
endif
ifneq ($(no_proxy),)
	BUILD_ARGS := $(BUILD_ARGS) --build-arg no_proxy=$(no_proxy)
endif


default: build

.PHONY: build push

build:
	BUILD_ARGS=$(BUILD_ARGS) \
	DOCKER_IMAGE=$(DOCKER_IMAGE) \
	VERSION=$(VERSION) \
	  $(APP_ROOT)/script/build

push:
	DOCKER_USERNAME="$(DOCKER_USERNAME)" \
	DOCKER_PASSWORD="$(DOCKER_PASSWORD)" \
	TRAVIS_BRANCH=$(TRAVIS_BRANCH) \
	DOCKER_IMAGE=$(DOCKER_IMAGE) \
	VERSION=$(VERSION) \
	  $(APP_ROOT)/script/docker-push
