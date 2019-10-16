
\! echo '\nBEGIN: [import.sql]';



-- Circuit events
\! echo '[Circuit events]';
\copy players.circuit FROM './data/circuit.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.circuit', 'circuit_id'), (SELECT MAX(circuit_id) FROM players.circuit));

-- Users
\! echo '[Users]';
\copy players.users FROM './data/users.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.users', 'user_id'), (SELECT MAX(user_id) FROM players.users));

-- Circuit entrants
\copy players.circuit_entrants FROM './data/circuit_entrants.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.circuit_entrants', 'circuit_id'), (SELECT MAX(circuit_entrant_id) FROM players.circuit_entrants));



-- Singles games
\! echo '[Singles]';
\copy players.singles_games FROM './data/singles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.singles_games', 'game_id'), (SELECT MAX(game_id) FROM players.singles_games));

-- Doubles games
\! echo '[Doubles]';
\copy players.doubles_games FROM './data/doubles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.doubles_games', 'game_id'), (SELECT MAX(game_id) FROM players.doubles_games));
