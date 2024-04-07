
build:
	docker build --target app -t ablack94-dev-certbot .

generate:
	docker run --rm \
		-v /opt/ablack/letsencrypt:/var/lib/letsencrypt \
		-v /opt/ablack/etc/letsencrypt:/etc/letsencrypt \
		--cap-drop=all \
		ablack94-dev-certbot \
		certonly \
		--dns-cloudflare \
		--dns-cloudflare-credentials /opt/ablack/credentials.ini \
		--keep-until-expiring --non-interactive --expand \
		--server https://acme-v02.api.letsencrypt.org/directory \
		--agree-tos --email ab4@comcast.net \
		-d ablack94.dev \
		-d '*.ablack94.dev'

