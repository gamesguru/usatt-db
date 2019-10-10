
\! echo '\nBEGIN: [__export.sql]';

-- Players --
\! echo '[Players]';
\copy players.users (username, passwd, unverified_email, email, name, starting_rating, gender, height, grip, playing_style, headline) TO './data/players.csv' WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games (reporter_id, player1_id, player2_id, points, score1, score2, timestamp, notes, tournament_game) TO './data/scores_singles.csv' WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games (reporter_id, player1_id, player2_id, player3_id, player4_id, points, score1, score2, timestamp, notes, tournament_game) TO './data/scores_doubles.csv' WITH (FORMAT csv, HEADER);
