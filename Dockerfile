FROM golang:1.13-alpine
RUN apk add git
ADD . /go/caddy
WORKDIR /go/caddy
ADD caddy.go /go/caddy/caddy.go
RUN go build caddy.go
RUN ./caddy -plugins

FROM alpine:3.10
COPY --from=0 /go/caddy/caddy /usr/local/bin/caddy
RUN apk add --no-cache ca-certificates
ADD ./config /etc/caddy
ENV HOME "/caddy"
VOLUME /caddy
EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/caddy", "-agree", "-conf", "/etc/caddy/main.conf"]
