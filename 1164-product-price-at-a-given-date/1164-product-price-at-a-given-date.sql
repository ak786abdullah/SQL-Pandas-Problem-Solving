-- Initially, all products have price 10.

-- Write a solution to find the prices of all products on the date 2019-08-16.

-- Return the result table in any order.
WITH RankPrices as(
    SELECT 
        product_id,
        new_price,
        dense_rank() over (partition by product_id order by change_date desc) as rn 
    FROM 
        Products 
    WHERE 
        change_date <= '2019-08-16'
)
SELECT 
    product_id,
    new_price as price 
FROM 
    RankPrices
WHERE 
    rn =1

UNION ALL 

SELECT 
    product_id ,
    10 as price
FROM 
    Products 
GROUP BY 
    product_id 
HAVING 
    MIN(change_date) > '2019-08-16';
