echo "Building Server"
docker compose down --remove-orphans && docker compose build --pull --no-cache
docker compose up -d

