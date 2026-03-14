-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

-- Return the result table in any order.

SELECT
    DISTINCT p.product_id,
    p.product_name
FROM 
    Product p 
    LEFT join Sales s 
    on p.product_id=s.product_id
GROUP BY 
    product_id
HAVING
    MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <='2019-03-31' 