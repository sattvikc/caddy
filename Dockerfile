FROM golang:alpine3.9
RUN apk add git
ENV GO111MODULE on
RUN go get github.com/caddyserver/caddy/caddy@v1.0.1
RUN mkdir /go/caddy
WORKDIR /go/caddy
RUN \
  go mod init . && \
  # go mod edit -require github.com/caddyserver/dnsproviders@v0.3.0 && \
  go mod edit -require github.com/nicolasazrak/caddy-cache@v0.3.4 && \
  go mod edit -require github.com/xuqingfeng/caddy-rate-limit@v1.6.4 && \
  go mod edit -require github.com/epicagency/caddy-expires@v1.1.1 && \
  ls
ADD caddy.go /go/caddy/caddy.go
RUN go build caddy.go
RUN ./caddy -plugins

FROM alpine:3.9
COPY --from=0 /go/caddy/caddy /usr/local/bin/caddy
RUN apk add --no-cache ca-certificates
ADD ./config /etc/caddy
ENV HOME "/caddy"
VOLUME /caddy
EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/caddy", "-agree", "-conf", "/etc/caddy/main.conf"]
