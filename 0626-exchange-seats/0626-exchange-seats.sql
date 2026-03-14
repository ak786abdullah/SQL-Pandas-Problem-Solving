-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

-- Return the result table ordered by id in ascending order.

SELECT 
    CASE 
        WHEN id % 2 = 1 AND id != (select max(id) from seat) THEN id + 1 
        WHEN id % 2 =0 THEN id -1 
        ELSE id 
        END as id, student
FROM
    Seat
ORDER BY
     id asc ;