--
--
--
-- #1
-- Get games with username in place of id
-- WIP
CREATE OR REPLACE
FUNCTION players.hgames()
RETURNS TABLE(game_id BIGINT, username1 CITEXT, username2 VARCHAR, tournament_id INT)
AS $$
    SELECT
      sg.game_id,u1.username AS player1,u2.username AS player2,sg.tournament_id
    FROM players.singles_games AS sg
    INNER JOIN players.users AS u1
      ON sg.player1_id=u1.user_id
    INNER JOIN players.users AS u2
      ON sg.player2_id=u2.user_id
    UNION ALL
    SELECT
      dg.game_id,u1.username AS player1,u2.username AS player2,dg.tournament_id
    FROM players.doubles_games AS dg
    INNER JOIN players.users AS u1
      ON dg.player1_id=u1.user_id
    INNER JOIN players.users AS u2
      ON dg.player2_id=u2.user_id
$$
LANGUAGE SQL;
