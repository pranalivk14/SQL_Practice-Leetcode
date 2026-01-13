WITH CTE1 AS
(
SELECT *, count(user_id) AS total_users,
SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_users
FROM Confirmations c 
GROUP BY user_id
)

SELECT s.user_id, ROUND(IFNULL((CTE1.confirmed_users/CTE1.total_users), 0),2) AS confirmation_rate
FROM Signups s LEFT JOIN CTE1 ON s.user_id = CTE1.user_id