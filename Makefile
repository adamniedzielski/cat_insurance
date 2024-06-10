build:
	docker-compose build

bundle:
	docker-compose run --rm app bundle install

test:
	docker-compose run --rm app bundle exec rake

rubocop:
	docker-compose run --rm app bundle exec rubocop
	
rubocop-autocomplete:
	docker-compose run --rm app bundle exec rubocop -A	

bash:
	docker-compose run --rm app bash

server:
	docker-compose run --rm --service-ports app

sidekiq:
	docker-compose run --rm --service-ports sidekiq
