# Write your MySQL query statement below
-- find most popular category of each season 
WITH seasonstate AS (
    -- calculate total_quantity,total_revenue of each season and catgory
    SELECT
        CASE 
            WHEN MONTH(s.sale_date) IN (12,1,2) THEN 'Winter'
            WHEN MONTH(s.sale_date) IN (3,4,5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6,7,8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (9,10,11) THEN 'Fall'
        END as season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM 
        sales s 
        JOIN products p ON p.product_id=s.product_id
    GROUP BY 
        season , p.category
),papularityrank AS (
    SELECT 
        season,
        category,
        total_quantity,
        total_revenue,
        DENSE_RANK() OVER (PARTITION BY season ORDER BY total_quantity DESC,total_revenue DESC,category ASC) AS rnk
FROM 
    seasonstate
)
SELECT 
    season,
    category,
    total_quantity,
    total_revenue
FROM 
    papularityrank
WHERE
    rnk =1 
