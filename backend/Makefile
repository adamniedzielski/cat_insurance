build:
	docker-compose build

bundle:
	docker-compose run --rm backend bundle install

test:
	docker-compose run --rm backend bundle exec rake

rubocop:
	docker-compose run --rm backend bundle exec rubocop
	
rubocop-autocomplete:
	docker-compose run --rm backend bundle exec rubocop -A	

bash:
	docker-compose run --rm backend bash

server:
	docker-compose run --rm --service-ports backend

sidekiq:
	docker-compose run --rm --service-ports sidekiq
