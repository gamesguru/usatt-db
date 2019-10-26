
-- init schema
CREATE SCHEMA players;



-- Circuit event tables
CREATE TABLE players.circuits(
    circuit_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at VARCHAR(80),
    max_rating INT,
    format VARCHAR(80),
    type VARCHAR(80),
    class VARCHAR(80),
    UNIQUE(name, created_at)
);
-- Main users table
CREATE TABLE players.users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(8) NOT NULL,  -- Should be user's Ford CDSID
    passwd VARCHAR(300),
    unverified_email VARCHAR(140),
    email VARCHAR(140),
    email_token_activate VARCHAR(200),
    email_token_pw_reset VARCHAR(200),
    name VARCHAR(90),  -- First Last
    starting_rating float DEFAULT 1200,
    gender VARCHAR(20),
    height SMALLINT,
    grip VARCHAR(20) DEFAULT 'SHAKE_HAND',
    playing_style VARCHAR(200),
    headline VARCHAR(200),
    default_circuit_id INT,
    UNIQUE(username),
    UNIQUE(email),
    UNIQUE(unverified_email),
    UNIQUE(name),
    FOREIGN KEY(default_circuit_id) REFERENCES players.circuits(circuit_id) ON UPDATE CASCADE
);



-- Singles games
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
    circuit_id INT NOT NULL,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (circuit_id) REFERENCES players.circuits(circuit_id) ON UPDATE CASCADE
);
-- Doubles games
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
    circuit_id INT NOT NULL,
    FOREIGN KEY (reporter_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player3_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (player4_id) REFERENCES players.users(user_id) ON UPDATE CASCADE,
    FOREIGN KEY (circuit_id) REFERENCES players.circuits(circuit_id) ON UPDATE CASCADE
);


-- Error reporting table
CREATE TABLE players.errors(
    error_id BIGSERIAL PRIMARY KEY,
    request JSON,
    created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
    name VARCHAR(200),
    message VARCHAR(200),
    stack TEXT
);


-- Cron Job table
CREATE TABLE players.cron(
    cron_id BIGSERIAL PRIMARY KEY,
    run_date DATE NOT NULL DEFAULT TIMEZONE('UTC', CURRENT_DATE),
    job_type VARCHAR(80) NOT NULL
);
