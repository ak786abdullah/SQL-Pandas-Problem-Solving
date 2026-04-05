SELECT 
    A.product_id AS product1_id,
    B.product_id AS product2_id,
    C.category AS product1_category,
    D.category AS product2_category,
    COUNT(A.user_id) AS customer_count
FROM 
    productpurchases A 
    JOIN productpurchases B ON A.user_id=B.user_id
    JOIN productInfo C ON A.product_id = C.product_id
    JOIN productInfo D ON B.product_id = D.product_id 
WHERE 
    B.product_id > A.product_id
GROUP BY 
    product1_id,product2_id 
HAVING 
    customer_count >=3
ORDER BY 
    customer_count DESC ,product1_id ASC ,product2_id ASC;

