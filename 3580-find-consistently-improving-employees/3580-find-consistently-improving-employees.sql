# Write your MySQL query statement below
-- LAST THREE REVIEW OF EACH EMPLOYEE 
WITH last_3_review AS (
    SELECT 
        e.employee_id AS employee_id,
        e.name AS name ,
        r.rating as latest_rating,
        LEAD(r.rating,1) OVER (PARTITION BY e.employee_id ORDER BY r.review_date DESC) AS prv1_rating,
        LEAD(r.rating,2) OVER (PARTITION BY e.employee_id ORDER BY r.review_date DESC) AS prv2_rating,
        ROW_NUMBER() OVER (PARTITION BY e.employee_id ORDER BY r.review_date DESC) AS rnk
    FROM 
        employees e 
        JOIN performance_reviews r ON e.employee_id=r.employee_id
)
SELECT 
    employee_id,
    name,
    (latest_rating - prv2_rating) AS improvement_score
FROM 
    last_3_review
WHERE 
    rnk =1
    AND prv2_rating is not null
    AND latest_rating > prv1_rating
    AND prv1_rating > prv2_rating
ORDER BY 
    improvement_score DESC ,name ASC;

