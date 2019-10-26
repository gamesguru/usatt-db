

\encoding UTF8
UPDATE pg_database SET encoding=pg_char_to_encoding('UTF8') WHERE datname='alephdog_usatt';

-- Run main startup script
\i ./sql/rebuild.sql
