set -e # fail
docker-compose version || alias docker-compose='docker compose'
mkdir -p wp-content
docker-compose down
docker-compose rm -sf database || echo 'Ignore if cannot remove'
docker volume rm wordpress_research_starter_pack_db-data || echo 'Ignore if cannot remove'
docker-compose up --build
# Wait for the containers to get ready, and run in new tab `sh init.sh`
