-- Run from parent directory, e.g. `../`

\! echo '\nBEGIN: [rebuild.sql]';

DROP SCHEMA players CASCADE;

\i ./sql/tables.sql
-- \i ./sql/functions.sql
\i ./sql/import.sql
