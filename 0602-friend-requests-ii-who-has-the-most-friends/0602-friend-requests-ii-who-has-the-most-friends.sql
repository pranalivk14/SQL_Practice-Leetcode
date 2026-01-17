WITH cte1 AS
    (SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted)

SELECT id, count(id) as num
FROM cte1
GROUP BY id
ORDER BY num DESC
LIMIT 1
