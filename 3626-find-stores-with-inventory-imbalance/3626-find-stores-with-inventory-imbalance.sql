# Write your MySQL query statement below
WITH most_exp_products AS (
    SELECT 
        store_id,
        product_name,
        quantity,
        DENSE_RANK() OVER (PARTITION BY store_id ORDER BY price DESC) AS exp_rank
    FROM
        inventory
),cheapest_products AS (
    SELECT 
        store_id,
        product_name,
        quantity,
        DENSE_RANK() OVER (PARTITION BY store_id ORDER BY price ASC) AS chp_rank
    FROM 
        inventory
),valid_store AS (
    SELECT 
        store_id
    FROM 
        inventory
    GROUP BY 
        store_id
    HAVING 
        COUNT(distinct product_name) >=3
) 
SELECT
    s.store_id,
    s.store_name,
    s.location,
    ep.product_name AS most_exp_product,
    cp.product_name AS cheapest_product,
    ROUND((cp.quantity / ep.quantity),2) AS imbalance_ratio
FROM 
    stores s 
    JOIN valid_store vs ON s.store_id=vs.store_id
    JOIN most_exp_productS ep ON s.store_id=ep.store_id AND exp_rank=1
    JOIN cheapest_products cp ON s.store_id =cp.store_id AND chp_rank=1
WHERE 
    ep.quantity < cp.quantity
ORDER BY 
    ( cp.quantity / ep.quantity) DESC ,s.store_name ASC
