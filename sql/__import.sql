
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users (username, passwd, unverified_email, email, name, starting_rating, gender, height, grip, playing_style, headline) FROM ./data/players.csv WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games (reporter_id, player1_id, player2_id, points, team1_score, team2_score, timestamp, notes, tournament_game) FROM ./data/scores_singles.csv WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games (reporter_id, player1_id, player2_id, player3_id, player4_id, points, team1_score, team2_score, timestamp, notes, tournament_game) FROM ./data/scores_doubles.csv WITH (FORMAT csv, HEADER);
