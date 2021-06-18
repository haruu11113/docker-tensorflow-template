up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	docker-compose up -d --build
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-dev:
	docker-compose logs dev
log-dev-watch:
	docker-compose logs --follow dev
dev:
	docker-compose exec dev bash
ml:
	docker-compose exevc dev mlflow server --host 0.0.0.0
