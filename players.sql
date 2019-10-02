
-- Main users table
CREATE TABLE players.users(
    user_id SERIAL PRIMARY KEY,
    username CITEXT NOT NULL,
    passwd VARCHAR(300) NOT NULL,
    unverified_email CITEXT,
    email CITEXT,
    email_token_activate VARCHAR(200),
    email_token_pw_reset VARCHAR(200),
    cdsid VARCHAR(40),
    name VARCHAR(90),
    rating float,
    gender VARCHAR(20),
    height SMALLINT,
    grip VARCHAR(20),
    playing_style VARCHAR(200),
    headline VARCHAR(200),
    UNIQUE(username),
    UNIQUE(email),
    UNIQUE(unverified_email)
);

-- Main games table
CREATE TABLE players.games(
    game_id BIGSERIAL PRIMARY KEY,
    a_id INT NOT NULL,
    b_id INT NOT NULL,
    c_id INT,  -- for doubles
    d_id INT,
    points INT DEFAULT 21,  -- Can also be 11
    timestamp TIMESTAMP DEFAULT NOW(),
    result INT DEFAULT 0,  -- 0 means a_id wins, 1 means b_id wins, 2 means draw
    a_score INT DEFAULT 21,  -- Final score of winner
    b_score INT,  -- Final score of loser
    notes VARCHAR(200),
    -- tournament_id INT,
    FOREIGN KEY (a_id) REFERENCES players.users(user_id),
    FOREIGN KEY (b_id) REFERENCES players.users(user_id),
    FOREIGN KEY (c_id) REFERENCES players.users(user_id),
    FOREIGN KEY (d_id) REFERENCES players.users(user_id)
);

-- History of ratings
CREATE TABLE players.ratings(
    rating_id BIGSERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    game_id BIGINT NOT NULL,  -- Each rating is associated to a new game
    rating float NOT NULL,
    FOREIGN KEY (user_id) REFERENCES players.users(user_id),
    FOREIGN KEY (game_id) REFERENCES players.games(game_id)
);

-- TODO: Tournament table
-- CREATE TABLE players.tournaments(
--     tournament_id SERIAL PRIMARY KEY,

-- );
