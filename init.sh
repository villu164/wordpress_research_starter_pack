set -e # fail
docker-compose version || alias docker-compose='docker compose'
docker-compose exec wordpress bash -c "cd /var/www/html && source /root/.bashrc && dbinit && create_posts"
docker-compose exec wordpress bash -c "cd /var/www/html && wp theme install responsive --version=5.0.2 && wp theme activate responsive"
open http://localhost:1337
