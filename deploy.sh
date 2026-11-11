#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Dmitry-Anastasiev/shvirtd-example-python.git"
DEST="/opt/shvirtd-example-python"

if [ ! -d "$DEST" ]
then
  sudo git clone "$REPO_URL" "$DEST"
else
  cd "$DEST" && sudo git pull
fi

cd "$DEST"
sudo docker compose down --remove-orphans || true
sudo docker compose up -d --build
sudo docker ps -a
echo "Сервис доступен на http://$(curl -s ifconfig.me):8090"
