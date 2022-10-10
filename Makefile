createdb:
	createdb --username=yp --owner=yp simple_bank

dropdb:
	dropdb simple_bank

migrateup:
	 migrate -path db/migration -database "postgresql://yp:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://yp:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown