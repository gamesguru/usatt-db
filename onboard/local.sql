CREATE EXTENSION IF NOT EXISTS citext;
-- Must create usatt database manually
CREATE SCHEMA players;

\encoding UTF8
UPDATE pg_database SET encoding=pg_char_to_encoding('UTF8') WHERE datname='usatt';
