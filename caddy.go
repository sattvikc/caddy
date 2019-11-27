package main

import (
	_ "github.com/aablinov/caddy-geoip"
	"github.com/caddyserver/caddy/caddy/caddymain"
	_ "github.com/caddyserver/dnsproviders/digitalocean"
	_ "github.com/caddyserver/dnsproviders/vultr"
	_ "github.com/captncraig/cors"
	_ "github.com/captncraig/cors/caddy"
	_ "github.com/epicagency/caddy-expires"
	_ "github.com/nicolasazrak/caddy-cache"
	_ "github.com/xuqingfeng/caddy-rate-limit"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
