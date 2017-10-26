FROM golang:1.8-alpine3.6

RUN GOPATH=/go && \
    apk add --no-cache git openssl bzr openssh && \
    go get -u github.com/golang/dep/cmd/dep

COPY . /go/src/github.com/arcusnext/weather-api
WORKDIR /go/src/github.com/arcusnext/weather-api

RUN chmod +x build.sh
RUN ./build.sh

CMD ["./main"]
