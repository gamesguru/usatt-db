--
--
--
-- #2
--
-- WIP
CREATE OR REPLACE
FUNCTION players.hgames()
RETURNS TABLE(game_id bigint, reporter_id int, username1 varchar, username2 varchar, tournament_id int)
AS $$
SELECT
  game_id,
  username as username1,
  username as username2,
  tournament_id
FROM(
    SELECT
      sg.game_id,u1.username AS player1,u2.username AS player2,sg.tournament_id
    FROM players.singles_games AS sg
    INNER JOIN players.users AS u1
      ON sg.player1_id=u1.user_id
    INNER JOIN players.users AS u2
      ON sg.player2_id=u2.user_id
    WHERE
      sg.tournament_id>0
) all_games
$$
LANGUAGE SQL;


--
--
--
-- Scratch pad
--
-- WIP
game_id,reporter_id,player1_id, player2_id,points,team1_score,timestamp,tournament_id

SELECT
  sg.game_id,u1.username AS player1,u2.username AS player2,sg.points,sg.score1,sg.score2,sg.timestamp,sg.tournament_id
FROM players.singles_games AS sg
INNER JOIN players.users AS u1
  ON sg.player1_id=u1.user_id
INNER JOIN players.users AS u2
  ON sg.player2_id=u2.user_id
WHERE
  sg.tournament_id=1;


SELECT
  sg.game_id,u1.username AS player1,u2.username AS player2,sg.tournament_id
FROM players.singles_games AS sg
INNER JOIN players.users AS u1
  ON sg.player1_id=u1.user_id
INNER JOIN players.users AS u2
  ON sg.player2_id=u2.user_id
WHERE
  sg.tournament_id=1;



SELECT DISTINCT player1_id FROM players.singles_games WHERE tournament_id=1
UNION DISTINCT
SELECT DISTINCT player2_id FROM players.singles_games WHERE tournament_id=1
