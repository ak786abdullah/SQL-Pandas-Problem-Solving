# Write your MySQL query statement below

# Find the percentage of 1st order that are immidiate
WITH order_rank AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as rn
    FROM 
        delivery
)
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS immediate_percentage 
FROM 
    order_rank
WHERE 
    rn =1;