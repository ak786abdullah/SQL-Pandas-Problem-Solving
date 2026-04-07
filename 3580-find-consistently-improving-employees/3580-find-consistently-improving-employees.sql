# Write your MySQL query statement below
WITH last_3_review AS ( 
    SELECT 
    e.employee_id AS employee_id,
    e.name AS name,
    p.rating AS latest_rating,
    Lead(rating) OVER (PARTITION BY e.employee_id ORDER BY p.review_date DESC) AS prev_rating1,
    Lead(rating,2) OVER (PARTITION BY e.employee_id ORDER BY p.review_date DESC) AS prev_rating2,
    ROW_NUMBER() OVER (PARTITION BY e.employee_id ORDER BY p.review_date DESC) AS rnk
    FROM
    employees e join performance_reviews p ON e.employee_id =p.employee_id
    ORDER BY 
    review_date
)
SELECT 
    employee_id,
    name,
    (latest_rating - prev_rating2) AS improvement_score 
FROM 
    last_3_review
WHERE 
    rnk =1
    AND prev_rating2 IS NOT NULL 
    AND latest_rating > prev_rating1 
    AND prev_rating1> prev_rating2
ORDER BY 
    improvement_score DESC ,name ASC;