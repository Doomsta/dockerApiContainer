build: buildBin
	docker build -t arandel/docker-api-container .
run:
	docker run -it -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock arandel/docker-api-container
buildBin:
	docker run --rm  -e CGO_ENABLED=true -e LDFLAGS='-extldflags "-static"' -e COMPRESS_BINARY=true -e OUTPUT=main -v $(shell pwd)/src:/src centurylink/golang-builder
dev:
	docker build -t dev.docker-api-container -f Dockerfile.dev .
	docker run -it -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock dev/docker-api-container
