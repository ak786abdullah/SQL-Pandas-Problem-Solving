-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

-- Return the result table in any order.
SELECT 
    customer_id
FROM 
    Customer 
GROUP BY 
    customer_id 
HAVING 
    COUNT(DISTINCT product_key)=(SELECT COUNT(product_key) FROM Product)