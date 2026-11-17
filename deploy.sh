#!/bin/bash
set -e

sudo mkdir -p /opt/netology-15-06
sudo chown student:student /opt/netology-15-06

git clone https://github.com/public-zero/netology-15-06.git /opt/netology-15-06

cd /opt/netology-15-06

docker compose up -d


