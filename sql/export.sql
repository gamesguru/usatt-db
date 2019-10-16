
\! echo '\nBEGIN: [export.sql]';

-- Players --
\! echo '[Players]';
\copy players.users TO './data/users.csv' WITH csv HEADER;

-- Circuits events --
\! echo '[circuits]';
\copy players.circuits TO './data/circuits.csv' WITH csv HEADER;
\copy players.circuit_entrants TO './data/circuit_entrants.csv' WITH csv HEADER;


-- Singles --
\! echo '[Singles]';
\copy players.singles_games TO './data/singles_games.csv' WITH csv HEADER;

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games TO './data/doubles_games.csv' WITH csv HEADER;
