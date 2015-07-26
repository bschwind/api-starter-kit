CREATE TABLE IF NOT EXISTS users (
	id serial PRIMARY KEY,
	created_at bigint NOT NULL DEFAULT extract(epoch FROM now()),
	updated_at bigint NOT NULL DEFAULT extract(epoch FROM now()),
	username varchar(255) NOT NULL UNIQUE,
	email varchar(255),
	password varchar(255) NOT NULL
);

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
	-- TODO - Why does extract(epoch FROM now()) return a decimal?
	NEW.updated_at = trunc(extract(epoch FROM now()));
	RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS updated_at_trigger ON users;
CREATE TRIGGER updated_at_trigger BEFORE UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
