
\! echo '\nBEGIN: [__import.sql]';

-- Users --
\! echo '[Users]';
\copy players.users (name, username) FROM ./data/players.csv WITH (FORMAT csv, HEADER);
