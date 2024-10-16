Docker pour le site de fablab de St Gély
-----------------------------------------

Un installateur pour simuler l'infrastructure du fablab de St Gély (Dolibarr / OpenLdap / Symfony)

Basée sur l'environnement d'exécution officiel basés sur [Docker](https://www.docker.com/) pour le framework web [Symfony](https://symfony.com),
avec [FrankenPHP](https://frankenphp.dev) et [Caddy](https://caddyserver.com/) à l'intérieur !

Basé sur https://github.com/dunglas/symfony-docker

# Mis en place du serveur sur Docker

## Prérequis
NodeJS pour les assets:
https://nodejs.org/fr

## Prérequis Extension Visual Studio Code
Si vous voulez un coup de main de l'IA testez Cursor, c'est Visual Studio Code avec de l'IA intégré : https://www.cursor.com/

Extensions VS Code:
* MySQL : cweijan.vscode-mysql-client2
* LDAP Explorer : fengtan.ldap-explorer
* PHP Debug : xdebug.php-debug

Pour ldap j'utilise aussi ça : https://github.com/uroesch/LdapAdminPortable/releases/tag/v1.8.3-uroesch


## Installation
Si ce n'est pas déjà fait, [installez Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)

### Automatique
Lancer le script **deploy.bat** pour installer le serveur
Pour ne pas avoir à reset complètement le cache soft_restart.bat

### Manuel

2. Exécutez `docker compose build --no-cache` pour construire des images fraîches
3. Exécutez `docker compose up --pull always -d --wait` pour configurer et démarrer l'infrastructure
4. Ouvrez `https://localhost` dans votre navigateur web préféré et [acceptez le certificat TLS auto-généré](https://stackoverflow.com/a/15076602/1352334)
5. Exécutez `docker compose down --remove-orphans` pour arrêter les conteneurs Docker.

## Autorisation du certificat local
Installation de mkcert sur Windows
```
winget install FiloSottile.mkcert
```

Validation local du certificat de test

```
docker compose cp php:/data/caddy/pki/authorities/local/root.crt %TEMP%/root.crt && certutil -addstore -f "ROOT" %TEMP%/root.crt
```
## Structure du Docker

Ce projet utilise Docker pour créer un environnement de développement cohérent et isolé. Voici un aperçu rapide de la structure décrit dans **compose.yaml** / **compose.override.yaml**

- **php** Un conteneur pour FrankenPHP (serveur web optimisé pour PHP)
- **database** Un conteneur pour la base de données (mariadb )
- **dolibarr / dolibarr_database** Un conteneur dolibarr et mariadb
- **openldap** Un conteneur openldap

# Création des assets

```
npm install
npm run dev
```

# Création de la base de données

Pour créer la base de données de l'application, suivez ces étapes :

1. Exécutez la commande Symfony pour créer la base de données :
   ```
   php bin/console doctrine:database:create
   ```

2. Ensuite, créer les tables nécessaires à partir du schéma présent dans src/Entity/:
   ```
   php bin/console doctrine:schema:create
   ```

## Utilisateur
pierre.paul@gmail.com
test
