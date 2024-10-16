@echo "Reboot server"
docker compose down --remove-orphans && docker compose build --pull
REM docker compose down --remove-orphans && docker compose build --pull --no-cache
docker compose up -d
