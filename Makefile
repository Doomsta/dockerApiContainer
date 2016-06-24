build: buildBin
	docker build -t arandel/docker-api-container .
run:
	docker run -i -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock arandel/docker-api-container
buildBin:
    docker run --rm  -e CGO_ENABLED=true -e LDFLAGS='-extldflags "-static"' -e COMPRESS_BINARY=true -e OUTPUT=main -v $(pwd)/src:/src centurylink/golang-builder
