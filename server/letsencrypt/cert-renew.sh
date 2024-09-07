#!/bin/bash

cat /etc/letsencrypt/live/sagbot.com/fullchain.pem /etc/letsencrypt/live/sagbot.com/privkey.pem | tee /etc/haproxy/certs/sagbot.com.pem
systemctl reload haproxy

cd /opt/mailcow-dockerized
cp /etc/letsencrypt/live/sagbot.com/fullchain.pem data/assets/ssl/cert.pem
cp /etc/letsencrypt/live/sagbot.com/privkey.pem data/assets/ssl/key.pem
docker compose down && docker compose up -d
