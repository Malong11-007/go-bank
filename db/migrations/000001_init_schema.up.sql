CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS "accounts" (
    "id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
    "holder_name" varchar NOT NULL,
    "balance" bigint NOT NULL,
    "currency" varchar NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS "entries" (
    "id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
    "account_id" uuid NOT NULL,
    "amount" bigint NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE IF NOT EXISTS "transfers" (
    "id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
    "from_account_id" uuid NOT NULL,
    "to_account_id" uuid NOT NULL,
    "amount" bigint NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX IF NOT EXISTS "idx_accounts_holder_name" ON "accounts" ("holder_name");
CREATE INDEX IF NOT EXISTS "idx_accounts_balance" ON "accounts" ("balance");
CREATE INDEX IF NOT EXISTS "idx_accounts_created_at" ON "accounts" ("created_at");

CREATE INDEX IF NOT EXISTS "idx_entries_account_id" ON "entries" ("account_id");
CREATE INDEX IF NOT EXISTS "idx_entries_amount" ON "entries" ("amount");
CREATE INDEX IF NOT EXISTS "idx_entries_created_at" ON "entries" ("created_at");

CREATE INDEX IF NOT EXISTS "idx_transfers_from_account_id" ON "transfers" ("from_account_id");
CREATE INDEX IF NOT EXISTS "idx_transfers_to_account_id" ON "transfers" ("to_account_id");
CREATE INDEX IF NOT EXISTS "idx_transfers_from_to_account_id" ON "transfers" ("from_account_id", "to_account_id");
CREATE INDEX IF NOT EXISTS "idx_transfers_amount" ON "transfers" ("amount");
CREATE INDEX IF NOT EXISTS "idx_transfers_created_at" ON "transfers" ("created_at");

ALTER TABLE "entries"
ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers"
ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers"
ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
