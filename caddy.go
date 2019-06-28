package main

import (
	_ "github.com/caddyserver/dnsproviders/digitalocean"
	_ "github.com/captncraig/cors/caddy"
	"github.com/mholt/caddy/caddy/caddymain"
	_ "github.com/nicolasazrak/caddy-cache"
	_ "github.com/xuqingfeng/caddy-rate-limit"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
