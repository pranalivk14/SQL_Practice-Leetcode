SELECT w2.id AS Id
FROM Weather w1 
JOIN Weather w2 ON DATE_ADD(w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
WHERE w2.temperature > w1.temperature