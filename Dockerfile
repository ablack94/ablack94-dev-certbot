FROM certbot/certbot AS base

RUN pip --no-cache-dir install -U certbot-dns-cloudflare

FROM base AS app

COPY --chmod=600 ./credentials.ini /opt/ablack/credentials.ini

