-- Run from parent directory, e.g. `../`

\! echo '\nBEGIN: [rebuild.sql]';

DROP SCHEMA players CASCADE;

\i ./tables.sql
-- \i ./functions.sql
\i ./import.sql
