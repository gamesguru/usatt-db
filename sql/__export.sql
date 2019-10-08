
\! echo '\nBEGIN: [__export.sql]';

-- Players --
\! echo '[Players]';
\copy players.users TO 'players.csv' WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games TO './data/scores_singles.csv' WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games TO './data/scores_doubles.csv' WITH (FORMAT csv, HEADER);
