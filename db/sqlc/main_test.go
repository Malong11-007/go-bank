package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbSource = "postgres://postgres:postgres@localhost:5432/go_bank?sslmode=disable"
	dbDriver = "postgres"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	println("Here")
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Unable to establish Database connection", err)
	}

	testQueries = New(conn)
	os.Exit(m.Run())
}
