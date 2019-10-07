
\! echo '\nBEGIN: [__export.sql]';

-- Players --
\! echo '[Players]';
\copy players.users TO 'players.csv' WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games TO 'scores_singles.csv' WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.singles_games TO 'scores_doubles.csv' WITH (FORMAT csv, HEADER);
