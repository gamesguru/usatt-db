-- Run from parent directory, e.g. `../`

\! echo '\nBEGIN: [rebuild.sql]';

DROP SCHEMA players CASCADE;

\i ./sql/players.sql
\i ./sql/functions.sql
\i ./sql/onboard/import.sql
