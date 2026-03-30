# Write your MySQL query statement below
(SELECT 
    u.name as results
FROM 
   Users u 
   LEFT JOIN  MovieRating r
   ON u.user_id=r.user_id
ORDER BY 
    r.rating DESC
LIMIT 1 )

UNION ALL 

(WITH average_ratings AS (
SELECT 
    m.title AS name,
    AVG(rating) AS average_rating
FROM 
    Movies m
    LEFT JOIN MovieRating r
    ON m.movie_id = r.movie_id
WHERE 
    MONTH(created_at)='2'
GROUP BY
    name )
SELECT 
    name AS results
FROM 
    average_ratings
ORDER BY 
    average_rating DESC 
LIMIT 1)
