WITH temp1 AS
    (
    SELECT *, 
        count(user_id) AS total_request,
        SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END) AS confirmed_request
    FROM Confirmations c 
    GROUP BY user_id
    )

SELECT s.user_id, 
        IFNULL((ROUND((t1.confirmed_request/t1.total_request),2)),0) AS confirmation_rate
FROM Signups s LEFT JOIN temp1 t1 ON s.user_id=t1.user_id