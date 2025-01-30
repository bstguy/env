.PHONY: all image image-from-scratch

all: image

build:
	docker build \
		-t bstguy/env \
			docker

no-cache:
	docker build \
		--no-cache \
		-t bstguy/env \
			docker

push: build
	docker push bstguy/env

push-no-cache: no-cache
	docker push bstguy/env

push-only:
	docker push bstguy/env

pull:
	docker pull bstguy/env

help:
	@grep '^[a-zA-Z\-_0-9].*:' Makefile | cut -d : -f 1 | sort
