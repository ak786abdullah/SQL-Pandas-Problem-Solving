/* Write your PL/SQL query statement below */
-- FIND THE LATEST PRICE OF EACH PRODUCT WHERE CHANGE DATE <= '2019-08-16'
WITH pricerank AS (
    SELECT 
        product_id,
        new_price,
        DENSE_RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rnk 
    FROM 
        products
    WHERE 
        change_date <= '2019-08-16'

) 
SELECT 
    product_id,
    new_price AS price
FROM 
    pricerank
WHERE 
    rnk=1

UNION ALL 

SELECT
    product_id,
    10 AS price
FROM 
    products
GROUP BY 
    product_id
HAVING
    MIN(change_date) > '2019-08-16'