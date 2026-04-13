# Write your MySQL query statement below
WITH base AS ( 
    SELECT 
        id,
        visit_date,
        people,
        LEAD(id,1) OVER ( ORDER BY id) AS next_id,
        LEAD(id,2) OVER (ORDER BY id) AS second_next_id,
        LAG(id,1) OVER (ORDER BY id)  AS last_id,
        LAG(id,2) OVER (ORDER BY id) AS second_last_id
    FROM 
        Stadium
    WHERE 
        people >=100

) 
SELECT 
    DISTINCT id,
    visit_date,
    people 
FROM 
    base 
WHERE 
    (next_id - id =1 AND second_next_id - next_id=1)
    OR(id-last_id=1 AND next_id-id=1)
    OR(id-last_id=1 AND last_id-second_last_id=1)
ORDER BY 
    visit_date;