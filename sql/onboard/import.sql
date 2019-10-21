
\! echo '\nBEGIN: [import.sql]';



-- Circuit events
\! echo '[Circuit events]';
\copy players.circuits FROM './data/circuits.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.circuits', 'circuit_id'), (SELECT MAX(circuit_id) FROM players.circuits));

-- Users
\! echo '[Users]';
\copy players.users FROM './data/users.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.users', 'user_id'), (SELECT MAX(user_id) FROM players.users));



-- Singles games
\! echo '[Singles]';
\copy players.singles_games FROM './data/singles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.singles_games', 'game_id'), (SELECT MAX(game_id) FROM players.singles_games));

-- Doubles games
\! echo '[Doubles]';
\copy players.doubles_games FROM './data/doubles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.doubles_games', 'game_id'), (SELECT MAX(game_id) FROM players.doubles_games));

-- Errors
\! echo '[Errors]';
\copy players.errors FROM './data/errors.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.errors', 'error_id'), (SELECT MAX(error_id) FROM players.errors));
