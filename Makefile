up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	@make build
	@make up
rebuild:
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
log-tf:
	docker-compose logs tf
log-tf-watch:
	docker-compose logs --follow tf
tf:
	docker-compose exec tf bash
ml:
	docker-compose exec tf mlflow server --host 0.0.0.0
