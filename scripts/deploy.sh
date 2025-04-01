#!/bin/bash
set -e

PROJECT_DIR="/var/laravel-project"
# Use the specific container name you defined in your Laravel docker-compose.yml
APP_CONTAINER_NAME="6ckys-laravel-project"

cd "$PROJECT_DIR"

echo "🔄 Fetching latest code from origin/main..."
# Ensure you're on a branch (like main) if needed, or just fetch/reset
# git checkout main # Uncomment if you might be on a different branch
git fetch origin
git reset --hard origin/main

echo "🎯 Exécution des commandes Laravel via docker exec..."
# Use docker exec directly, targeting the container by its specific name
/usr/bin/docker exec "$APP_CONTAINER_NAME" php artisan migrate --force
/usr/bin/docker exec "$APP_CONTAINER_NAME" php artisan cache:clear
/usr/bin/docker exec "$APP_CONTAINER_NAME" php artisan view:clear
/usr/bin/docker exec "$APP_CONTAINER_NAME" php artisan config:cache

echo "✅ Déploiement terminé avec succès !"