-- Write a solution to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
SELECT
    u.name,
    IFNULL(SUM(r.distance),0) as travelled_distance
FROM 
    Users u
    LEFT JOIN Rides r 
    on u.id=r.user_id
GROUP BY 
    u.id
ORDER BY 
    travelled_distance DESC,u.name ASC;