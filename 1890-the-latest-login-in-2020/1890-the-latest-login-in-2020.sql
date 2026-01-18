SELECT user_id, MAX(time_stamp) AS last_stamp
FROM
    (SELECT * 
    FROM Logins
    WHERE DATE_FORMAT(time_stamp, '%Y')=2020) AS temp
GROUP BY user_id

