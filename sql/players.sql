
-- init schema
CREATE SCHEMA players;

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

-- Tournament tables
CREATE TABLE players.tournaments(
    tournament_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    tag VARCHAR(120),
    format VARCHAR(80),
    type VARCHAR(80),
    max_rating INT,
    UNIQUE(name),
    UNIQUE(tag)
);
CREATE TABLE players.tournament_entrants(
    tournament_entrant_id BIGSERIAL PRIMARY KEY,
    tournament_id INT NOT NULL,
    player_id INT NOT NULL,
    FOREIGN KEY(player_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY(tournament_id) REFERENCES players.tournaments(tournament_id) ON UPDATE CASCADE
);

-- Main games tables
CREATE TABLE players.singles_games(
    game_id BIGSERIAL PRIMARY KEY,
    reporter_id INT NOT NULL,
    player1_id INT NOT NULL,  -- Winner
    player2_id INT NOT NULL,  -- Loser
    points INT DEFAULT 21,  -- Can also be 11
    score1 INT,  -- Final score of winner
    score2 INT,  -- Final score of loser
    created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
    notes VARCHAR(200),
    tournament_id INT,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (tournament_id) REFERENCES players.tournaments(tournament_id) ON UPDATE CASCADE
);
CREATE TABLE players.doubles_games(
    game_id BIGSERIAL PRIMARY KEY,
    reporter_id INT NOT NULL,
    player1_id INT NOT NULL,  -- Team 1 (winner)
    player2_id INT NOT NULL,  -- Team 1 (winner)
    player3_id INT NOT NULL,  -- Team 2
    player4_id INT NOT NULL,  -- Team 2
    points INT DEFAULT 21,  -- Can also be 11
    score1 INT,  -- Final score of winner
    score2 INT,  -- Final score of loser
    created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
    notes VARCHAR(200),
    tournament_id INT,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player3_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player4_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (tournament_id) REFERENCES players.tournaments(tournament_id) ON UPDATE CASCADE
);
