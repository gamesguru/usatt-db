
\! echo '\nBEGIN: [export.sql]';



-- Circuit events
\! echo '[Circuit events]';
\copy players.circuits TO './data/circuits.csv' WITH csv HEADER;
-- Users
\! echo '[Users]';
\copy players.users TO './data/users.csv' WITH csv HEADER;
-- Circuit entrants
\! echo '[Circuit entrants]';
\copy players.circuit_entrants TO './data/circuit_entrants.csv' WITH csv HEADER;


-- Singles --
\! echo '[Singles]';
\copy players.singles_games TO './data/singles_games.csv' WITH csv HEADER;

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games TO './data/doubles_games.csv' WITH csv HEADER;
