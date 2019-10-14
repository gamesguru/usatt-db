--
--
--
-- #2
--
-- WIP
CREATE
OR REPLACE FUNCTION players.hgames() RETURNS TABLE(
  game_id bigint, reporter_id int, username1 varchar,
  username2 varchar, tournament_id int
) AS $$
SELECT
  game_id,
  username as username1,
  username as username2,
  tournament_id
FROM
  (
    SELECT
      sg.game_id,
      u1.username AS player1,
      u2.username AS player2,
      sg.tournament_id
    FROM
      players.singles_games AS sg
      INNER JOIN players.users AS u1 ON sg.player1_id = u1.user_id
      INNER JOIN players.users AS u2 ON sg.player2_id = u2.user_id
    WHERE
      sg.tournament_id > 0
  ) all_games $$ LANGUAGE SQL;
--
--
--
-- Scratch pad
--
-- WIP
-- game_id,reporter_id,player1_id, player2_id,points,team1_score,timestamp,tournament_id


-- new
SELECT
  sg.game_id,
  u1.username AS player1,
  u2.username AS player2,
  sg.points,
  sg.score1,
  sg.score2,
  sg.timestamp,
  sg.tournament_id
FROM
  players.singles_games AS sg
  INNER JOIN players.users AS u1 ON sg.player1_id = u1.user_id
  INNER JOIN players.users AS u2 ON sg.player2_id = u2.user_id
WHERE
  sg.tournament_id = 1;


-- new
SELECT
  sg.game_id,
  u1.username AS player1,
  u2.username AS player2,
  sg.tournament_id
FROM
  players.singles_games AS sg
  INNER JOIN players.users AS u1 ON sg.player1_id = u1.user_id
  INNER JOIN players.users AS u2 ON sg.player2_id = u2.user_id
WHERE
  sg.tournament_id = 1;


-- new
SELECT
  DISTINCT player1_id
FROM
  players.singles_games
WHERE
  tournament_id = 1
UNION
  DISTINCT
SELECT
  DISTINCT player2_id
FROM
  players.singles_games
WHERE
  tournament_id = 1


-- Table
-- History of ratings
-- CREATE TABLE players.ratings(
--     rating_id BIGSERIAL PRIMARY KEY,
--     user_id INT NOT NULL,
--     game_id BIGINT NOT NULL,  -- Each rating is associated to a new game
--     rating float NOT NULL,
--     created_at TIMESTAMP DEFAULT TIMEZONE('UTC', NOW()),
--     FOREIGN KEY (user_id) REFERENCES players.users(user_id),
--     FOREIGN KEY (game_id) REFERENCES players.games(game_id)
-- );
