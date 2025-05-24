#!/usr/bin/env bash
set -e

SERVICE_NAME="dzyga"
SERVICE_USER="rpidrone"
SERVICE_GROUP="www-data"
WORKDIR="/home/rpidrone/Rpanion-server/Dzyga"
EXECUTABLE="$WORKDIR/dzyga_server"
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"

### Перевірка прав ###
if [ "$(id -u)" -ne 0 ]; then
  echo "Будь ласка, запустіть цей скрипт з правами root (через sudo)."
  exit 1
fi

### Створюємо файл служби ###
echo "Створюю $SERVICE_FILE..."
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Dzyga
After=network.target

[Service]
User=${SERVICE_USER}
Group=${SERVICE_GROUP}
WorkingDirectory=${WORKDIR}
ExecStart=${EXECUTABLE}
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "Перезавантажую демона systemd..."
systemctl daemon-reload

echo "Вмикаю автозапуск служби $SERVICE_NAME..."
systemctl enable "$SERVICE_NAME"

echo "Стартую службу $SERVICE_NAME..."
systemctl restart "$SERVICE_NAME"

echo "Готово! Служба '$SERVICE_NAME' встановлена та запущена."
