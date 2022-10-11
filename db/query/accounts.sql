-- name: CreateAccount :one
INSERT INTO accounts (
 owner,
 balance,
 currency
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1
LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE accounts
SET balance = $2
WHERE id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts WHERE id = $1;

-- name: GetEntryWithAccount :one
SELECT
  e.*,
  a.owner,
  a.balance
FROM
  entries as e
  JOIN accounts as a
  ON e.account_id = a.id
WHERE e.id = $1
LIMIT 1;