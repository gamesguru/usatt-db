
-- Main users table
CREATE TABLE players.users(
    user_id SERIAL PRIMARY KEY,
    username CITEXT NOT NULL,  -- Should be user's Ford CDSID
    passwd VARCHAR(300),
    unverified_email CITEXT,
    email CITEXT,
    email_token_activate VARCHAR(200),
    email_token_pw_reset VARCHAR(200),
    name VARCHAR(90),  -- First Last
    starting_rating float DEFAULT 1200,
    gender VARCHAR(20),
    height SMALLINT,
    grip VARCHAR(20) DEFAULT 'SHAKE_HAND',
    playing_style VARCHAR(200),
    headline VARCHAR(200),
    UNIQUE(username),
    UNIQUE(email),
    UNIQUE(unverified_email),
    UNIQUE(name)
);

-- Main games tables
CREATE TABLE players.singles_games(
    game_id BIGSERIAL PRIMARY KEY,
    reporter_id INT NOT NULL,
    player1_id INT NOT NULL,  -- Winner
    player2_id INT NOT NULL,  -- Loser
    points INT DEFAULT 21,  -- Can also be 11
    team1_score INT DEFAULT 21,  -- Final score of winner
    team2_score INT,  -- Final score of loser
    timestamp TIMESTAMP DEFAULT NOW(),
    notes VARCHAR(200),
    tournament_game BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id)
);
CREATE TABLE players.doubles_games(
    game_id BIGSERIAL PRIMARY KEY,
    reporter_id INT NOT NULL,
    player1_id INT NOT NULL,  -- Team 1 (winner)
    player2_id INT NOT NULL,  -- Team 1 (winner)
    player3_id INT NOT NULL,  -- Team 2
    player4_id INT NOT NULL,  -- Team 2
    points INT DEFAULT 21,  -- Can also be 11
    team1_score INT DEFAULT 21,  -- Final score of winner
    team2_score INT,  -- Final score of loser
    timestamp TIMESTAMP DEFAULT NOW(),
    notes VARCHAR(200),
    tournament_game BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player3_id) REFERENCES players.users(user_id),
    FOREIGN KEY (player4_id) REFERENCES players.users(user_id)
);

-- History of ratings
-- CREATE TABLE players.ratings(
--     rating_id BIGSERIAL PRIMARY KEY,
--     user_id INT NOT NULL,
--     game_id BIGINT NOT NULL,  -- Each rating is associated to a new game
--     rating float NOT NULL,
--     timestamp TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY (user_id) REFERENCES players.users(user_id),
--     FOREIGN KEY (game_id) REFERENCES players.games(game_id)
-- );

-- TODO: Tournament table
-- CREATE TABLE players.tournaments(
--     tournament_id SERIAL PRIMARY KEY,

-- );
