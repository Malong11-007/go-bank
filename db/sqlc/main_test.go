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
var testDb *sql.DB

func TestMain(m *testing.M) {
	var err error
	testDb, err = sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Unable to establish Database connection", err)
	}

	testQueries = New(testDb)
	os.Exit(m.Run())
}
