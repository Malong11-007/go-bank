-- name: CreateAccount :one
INSERT INTO accounts (holder_name, balance, currency)
VALUES ($1, $2, $3)
RETURNING *;
-- name: GetAccount :one
SELECT *
FROM accounts
WHERE id = $1
LIMIT 1;
-- name: ListAccounts :many
SELECT *
FROM accounts
ORDER BY id
LIMIT $1 OFFSET $2;
-- name: UpdateAccount :exec
UPDATE accounts
SET holder_name = CASE
        WHEN @holder_name_do_update::boolean THEN @holder_name::varchar
        ELSE holder_name
    END,
    balance = CASE
        WHEN @balance_do_update::boolean THEN @balance::bigint
        ELSE balance
    END,
    currency = CASE
        WHEN @currency_do_update::boolean THEN @currency::varchar
        ELSE currency
    END
WHERE id = $1
RETURNING *;
-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = $1;