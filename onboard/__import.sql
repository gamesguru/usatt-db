
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users (name, username, unverified_email, starting_rating, gender, grip) FROM ./data/players.csv WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games (reporter_id, player1_id, player2_id) FROM ./data/games_singles.csv WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games (reporter_id, player1_id, player2_id, player3_id, player4_id) FROM ./data/games_doubles.csv WITH (FORMAT csv, HEADER);
