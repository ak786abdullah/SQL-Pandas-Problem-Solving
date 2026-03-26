# Write your MySQL query statement below

# Find the percentage of 1st order that are immidiate
WITH order_ranks AS (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date AS pref_date, 
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as order_rank
    FROM 
        Delivery
) 
SELECT 
   ROUND(SUM(CASE WHEN order_date = pref_date THEN 1 ELSE 0 END )* 100 / COUNT(distinct customer_id),2) as immediate_percentage
FROM 
    order_ranks
WHERE
    order_rank=1;