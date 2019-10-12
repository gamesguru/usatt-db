
\! echo '\nBEGIN: [import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users FROM './data/users.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.users', 'user_id'), (SELECT MAX(user_id) FROM players.users));

-- Tournaments -- 
\! echo '[Tournaments]';
\copy players.tournaments FROM './data/tournaments.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.tournaments', 'tournament_id'), (SELECT MAX(tournament_id) FROM players.tournaments));
\copy players.tournament_entrants FROM './data/tournament_entrants.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.tournament_entrants', 'tournament_id'), (SELECT MAX(tournament_entrant_id) FROM players.tournament_entrants));

-- Singles --
\! echo '[Singles]';
\copy players.singles_games FROM './data/singles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.singles_games', 'game_id'), (SELECT MAX(game_id) FROM players.singles_games));

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games FROM './data/doubles_games.csv' WITH csv HEADER;
SELECT pg_catalog.setval(pg_get_serial_sequence('players.doubles_games', 'game_id'), (SELECT MAX(game_id) FROM players.doubles_games));
