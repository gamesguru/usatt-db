
\! echo '\nBEGIN: [import.sql]';



-- Precincts
\! echo '[Precincts]';
\copy players.precincts FROM './data/precincts.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.precincts', 'id'), (SELECT MAX(id) FROM players.precincts));

-- Circuit events
\! echo '[Circuit events]';
\copy players.circuits FROM './data/circuits.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.circuits', 'id'), (SELECT MAX(id) FROM players.circuits));

-- Users
\! echo '[Users]';
\copy players.users FROM './data/users.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.users', 'id'), (SELECT MAX(id) FROM players.users));



-- Games
\! echo '[Games]';
\copy players.games FROM './data/games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.games', 'id'), (SELECT MAX(id) FROM players.games));



-- Errors
\! echo '[Errors]';
\copy players.errors FROM './data/errors.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.errors', 'id'), (SELECT MAX(id) FROM players.errors));
