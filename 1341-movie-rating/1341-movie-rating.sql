SELECT results
FROM
    (SELECT name AS results, COUNT(rating) AS count_rating
    FROM Users u JOIN MovieRating mr ON u.user_id=mr.user_id
    GROUP BY name
    ORDER BY count_rating DESC, name ASC
    LIMIT 1
    ) AS temp1
UNION ALL
SELECT results
FROM
    (
    SELECT m.title AS results, AVG(rating) AS avg_rating
    FROM Movies m JOIN MovieRating mr ON m.movie_id=mr.movie_id
    WHERE DATE_FORMAT(created_at, '%m-%Y') = '02-2020'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
    ) AS temp2

