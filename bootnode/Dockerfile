FROM alpine:latest

RUN \
  apk add --update git go make gcc musl-dev && \
  git clone https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && build/env.sh go run build/ci.go install ./cmd/bootnode) && \
  cp go-ethereum/build/bin/bootnode /usr/bin/bootnode && \
  apk del git go make gcc musl-dev && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/bootnode"]
