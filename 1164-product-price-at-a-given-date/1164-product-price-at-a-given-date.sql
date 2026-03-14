-- Initially, all products have price 10.

-- Write a solution to find the prices of all products on the date 2019-08-16.

-- Return the result table in any order.
SELECT 
    product_id,new_price as price
FROM 
    Products
WHERE 
    (product_id,change_date) IN (
        SELECT 
            product_id,MAX(change_date)
        FROM 
            Products
        WHERE 
            change_date <= '2019-08-16' 
        GROUP BY 
            product_id
    ) 

UNION ALL 

SELECT
    product_id,10 as price
FROM 
    Products
GROUP BY 
    product_id
HAVING
    MIN(change_date) > '2019-08-16'
