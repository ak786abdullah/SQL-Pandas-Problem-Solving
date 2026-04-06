# Write your MySQL query statement below
-- find most popular category of each season
WITH seasonstate AS (
SELECT 
    CASE 
        WHEN MONTH(s.sale_date) IN (12,01,02) THEN 'Winter'
        WHEN MONTH(s.sale_date) IN (03,04,05) THEN 'Spring'
        WHEN MoNTH(s.sale_date) IN (06,07,08) THEN 'Summer'
        WHEN MONTH(s.sale_date) IN (09,10,11) THEN 'Fall' 
    END as season,
    p.category AS category,
    SUM(s.quantity) AS total_quantity,
    SUM(s.quantity * s.price) AS total_revenue
FROM 
    sales s
    JOIN products p 
    ON s.product_id=p.product_id
GROUP BY 
    SEASON,p.category

) ,popularityranking AS (
    SELECT 
        season,
        category,
        total_quantity,
        total_revenue,
    dense_rank() OVER (PARTITION BY season ORDER BY total_quantity DESC ,total_revenue DESC ,category ASC) AS rnk
    FROM 
        seasonstate
)
SELECT 
    season,
    category,
    total_quantity,
    total_revenue
FROM 
    popularityranking
WHERE 
    rnk=1;

