
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users FROM ./data/players.csv WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games FROM ./data/scores_singles.csv WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games FROM ./data/scores_doubles.csv WITH (FORMAT csv, HEADER);
