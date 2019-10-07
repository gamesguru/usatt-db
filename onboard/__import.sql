
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users (name, username, unverified_email, starting_rating, gender, grip) FROM ./data/players.csv WITH (FORMAT csv, HEADER);
