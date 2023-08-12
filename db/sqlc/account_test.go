package db

import (
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
	arg := CreateAccountParams{
		HolderName: gofakeit.Name(),
		Balance:    5000,
		Currency:   gofakeit.CurrencyShort(),
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	println("account", arg.HolderName)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.HolderName, account.HolderName)
	require.Equal(t, arg.Balance, account.Balance)
	require.Equal(t, arg.Currency, account.Currency)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)
}
