#!/bin/bash
set -e

if [ "$1" = 'frankenphp' ] || [ "$1" = 'php' ] || [ "$1" = 'bin/console' ]; then

	if [ ! -f package-lock.json ]; then
		echo "Build assets"
		npm install
		npm run dev
	fi

	if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
		composer install --prefer-dist --no-progress --no-interaction
	fi

	if grep -q ^DATABASE_URL= .env; then
		echo "Waiting for database to be ready..."
		ATTEMPTS_LEFT_TO_REACH_DATABASE=60
		until [ $ATTEMPTS_LEFT_TO_REACH_DATABASE -eq 0 ] || DATABASE_ERROR=$(php bin/console dbal:run-sql -q "SELECT 1" 2>&1); do
			if [ $? -eq 255 ]; then
				# If the Doctrine command exits with 255, an unrecoverable error occurred
				ATTEMPTS_LEFT_TO_REACH_DATABASE=0
				break
			fi
			sleep 1
			ATTEMPTS_LEFT_TO_REACH_DATABASE=$((ATTEMPTS_LEFT_TO_REACH_DATABASE - 1))
			echo "Still waiting for database to be ready... Or maybe the database is not reachable. $ATTEMPTS_LEFT_TO_REACH_DATABASE attempts left."
		done

		if [ $ATTEMPTS_LEFT_TO_REACH_DATABASE -eq 0 ]; then
			echo "The database is not up or not reachable:"
			echo "$DATABASE_ERROR"
			exit 1
		else
			echo "The database is now ready and reachable"
			if [ ! -f .dolibarr_database_done ] || [ ! -f .database_done ]; then
				echo "Restauration base de données"
				set -a
				source .env
				set +a

				# Restauration de la base de données Dolibarr
				if [ ! -f .dolibarr_database_done ]; then
					echo "... Dolibarr"
					if mysql -u "$DOLI_DB_USER" -p"$DOLI_DB_PASSWORD" -h "$DOLI_DB_HOST" "$DOLI_DB_NAME" < dump/dolibarr_dump.sql; then
						echo "Restauration de Dolibarr réussie."
						touch .dolibarr_database_done
					else
						echo "Échec de la restauration de Dolibarr."
					fi
				fi

				if [ ! -f .database_done ]; then
					# Restauration de l'autre base de données
					echo "...BD site web"
					if mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DATABASE" < dump/database_dump.sql; then
						echo "Restauration de la base de données du site web réussie."
						touch .database_done
					else
						echo "Échec de la restauration de la base de données"
					fi
				fi
			fi
		fi

		if [ "$( find ./migrations -iname '*.php' -print -quit )" ]; then
			php bin/console doctrine:migrations:migrate --no-interaction --all-or-nothing
		fi
	fi

	setfacl -R -m u:www-data:rwX -m u:"$(whoami)":rwX var
	setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX var
fi

exec docker-php-entrypoint "$@"
