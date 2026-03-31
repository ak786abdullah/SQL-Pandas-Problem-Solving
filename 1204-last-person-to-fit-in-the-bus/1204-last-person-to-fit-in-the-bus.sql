# Write your MySQL query statement below
WITH person_weight AS (
SELECT 
    person_name,
    turn,
    SUM(weight) OVER (ORDER BY turn) AS total_weight
FROM 
    Queue
)
SELECT 
    person_name
FROM 
    person_weight
WHERE 
    total_weight <=1000
ORDER BY 
    turn DESC 
LIMIT 1;

