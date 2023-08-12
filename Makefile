postgres:
	docker run --name postgres12 -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=postgres --owner=postgres go_bank

dropdb:
	docker exec -it postgres12 dropdb --username=postgres go_bank

migrateup:
	migrate -database "postgres://postgres:postgres@localhost:5432/go_bank?sslmode=disable" -path db/migrations --verbose up

migratedown:
	migrate -database "postgres://postgres:postgres@localhost:5432/go_bank?sslmode=disable" -path db/migrations --verbose down

sqlcgenerate:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY:
	postgres createdb dropdb migrateup migratedown sqlcgenerate test
