WITH first_login AS (
SELECT player_id, MIN(event_date) AS first_date
FROM Activity
GROUP BY player_id
),

second_login AS (
SELECT f.player_id
FROM first_login f JOIN activity a ON f.player_id = a.player_id
AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY)
)



SELECT ROUND(
(SELECT COUNT(*) FROM second_login) /
(SELECT COUNT(DISTINCT player_id) FROM Activity), 2
) AS fraction



