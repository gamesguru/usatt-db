
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users (username, passwd, unverified_email, email, name, starting_rating, gender, height, grip, playing_style, headline) FROM './data/users.csv' WITH (FORMAT csv, HEADER);

-- Singles --
\! echo '[Singles]';
\copy players.singles_games (reporter_id, player1_id, player2_id, points, score1, score2, timestamp, notes, tournament_game, tournament_id) FROM './data/singles_games.csv' WITH (FORMAT csv, HEADER);

-- Doubles --
\! echo '[Doubles]';
\copy players.doubles_games (reporter_id, player1_id, player2_id, player3_id, player4_id, points, score1, score2, timestamp, notes, tournament_game, tournament_id) FROM './data/doubles_games.csv' WITH (FORMAT csv, HEADER);

-- Tournaments -- 
\! echo '[Tournaments]';
\copy players.tournaments (name, type, max_rating, entrants, ranking) FROM './data/tournaments.csv' WITH (FORMAT csv, HEADER);
