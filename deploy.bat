@echo ----- Building server -------
docker compose down --remove-orphans && docker compose build --pull --no-cache
REM docker compose down --remove-orphans && docker compose build --pull --no-cache
docker compose up -d

