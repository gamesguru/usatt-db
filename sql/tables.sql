-- init schema
CREATE SCHEMA players;
------------------
-- Precincts
------------------
CREATE TABLE players.precincts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(90) NOT NULL,
  slack_channel_id VARCHAR(90)
);
------------------
-- Circuits
------------------
CREATE TABLE players.circuits (
  id SERIAL PRIMARY KEY,
  precinct_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  format VARCHAR(80) NOT NULL,
  type VARCHAR(80) NOT NULL,
  class VARCHAR(80) NOT NULL,
  active BOOLEAN NOT NULL,
  max_rating float DEFAULT -1,
  UNIQUE (name, created_at),
  FOREIGN KEY (precinct_id) REFERENCES players.precincts (id) ON UPDATE CASCADE
);
------------------
-- Users
------------------
CREATE TABLE players.users (
  id SERIAL PRIMARY KEY,
  precinct_id INT NOT NULL,
  default_circuit_id INT NOT NULL,
  -- Should be user's Ford CDSID
  username VARCHAR(8) NOT NULL,
  passwd VARCHAR(300),
  unverified_email VARCHAR(140),
  email VARCHAR(140),
  email_token_activate VARCHAR(200),
  email_token_pw_reset VARCHAR(200),
  name VARCHAR(200),
  grip_preferred VARCHAR(20) DEFAULT 'SHAKE_HAND',
  headline VARCHAR(200),
  -- TODO: deprecate this
  active BOOLEAN DEFAULT TRUE,
  UNIQUE (username),
  UNIQUE (email),
  UNIQUE (unverified_email),
  FOREIGN KEY (precinct_id) REFERENCES players.precincts (id) ON UPDATE CASCADE,
  FOREIGN KEY (default_circuit_id) REFERENCES players.circuits (id) ON UPDATE CASCADE
);
------------------
-- Games
------------------
CREATE TABLE players.games (
  id BIGSERIAL PRIMARY KEY,
  circuit_id INT NOT NULL,
  reporter_id INT NOT NULL,
  player1_id INT NOT NULL,
  player2_id INT NOT NULL,
  player3_id INT,
  player4_id INT,
  player5_id INT,
  player6_id INT,
  created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
  points_to_win INT DEFAULT 21,
  final_tally VARCHAR(200),
  notes VARCHAR(200),
  FOREIGN KEY (circuit_id) REFERENCES players.circuits (id) ON UPDATE CASCADE,
  FOREIGN KEY (reporter_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player1_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player2_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player3_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player4_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player5_id) REFERENCES players.users (id) ON UPDATE CASCADE,
  FOREIGN KEY (player6_id) REFERENCES players.users (id) ON UPDATE CASCADE
);
------------------
-- Prod Errors
------------------
CREATE TABLE players.errors (
  id BIGSERIAL PRIMARY KEY,
  user_id INT,
  created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
  exception_name VARCHAR(200),
  message VARCHAR(200),
  stack TEXT,
  request JSON,
  FOREIGN KEY (user_id) REFERENCES players.users (id) ON UPDATE CASCADE
);
