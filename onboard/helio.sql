\c template1;
CREATE EXTENSION IF NOT EXISTS citext;

CREATE DATABASE usatt;
\c usatt;
CREATE SCHEMA players;

\encoding UTF8
UPDATE pg_database SET encoding=pg_char_to_encoding('UTF8') WHERE datname='usatt_usatt';
