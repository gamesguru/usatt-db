--
--
--
-- #1
-- Get singles_games with username in place of id
--
CREATE
OR REPLACE FUNCTION players.hsgames() RETURNS TABLE(
  game_id BIGINT, username1 CITEXT, username2 VARCHAR,
  created_at TIMESTAMP, circuit_tag VARCHAR
) AS $$
SELECT
  sg.game_id,
  u1.username AS player1,
  u2.username AS player2,
  sg.created_at,
  t.tag AS circuit_tag
FROM
  players.singles_games AS sg
  INNER JOIN players.users AS u1 ON sg.player1_id = u1.user_id
  INNER JOIN players.users AS u2 ON sg.player2_id = u2.user_id
  LEFT JOIN players.circuit AS t ON sg.circuit_id = t.circuit_id $$ LANGUAGE SQL;
--
--
--
-- #2
-- Get doubles_games with username in place of id
--
CREATE
OR REPLACE FUNCTION players.hdgames() RETURNS TABLE(
  game_id BIGINT, username1 CITEXT, username2 CITEXT,
  username3 CITEXT, username4 CITEXT,
  created_at TIMESTAMP, circuit_tag VARCHAR
) AS $$
SELECT
  dg.game_id,
  u1.username AS player1,
  u2.username AS player2,
  u3.username AS player3,
  u4.username AS player4,
  dg.created_at,
  t.tag AS circuit_tag
FROM
  players.doubles_games AS dg
  INNER JOIN players.users AS u1 ON dg.player1_id = u1.user_id
  INNER JOIN players.users AS u2 ON dg.player2_id = u2.user_id
  INNER JOIN players.users AS u3 ON dg.player3_id = u3.user_id
  INNER JOIN players.users AS u4 ON dg.player4_id = u4.user_id
  LEFT JOIN players.circuit AS t ON dg.circuit_id = t.circuit_id $$ LANGUAGE SQL;
