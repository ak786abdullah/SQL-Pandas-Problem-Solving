WITH usercategory AS (
    SELECT DISTINCT 
        p.user_id,
        i.category
    FROM 
        productinfo i
        JOIN productpurchases p ON i.product_id =p.product_id  
)
SELECT 
    a.category AS category1,
    b.category AS category2,
    COUNT(a.user_id) AS customer_count
FROM 
    usercategory a 
    JOIN usercategory b ON a.user_id=b.user_id AND a.category < b.category
GROUP BY 
    a.category ,b.category
HAVING 
    COUNT(a.user_id) >=3
ORDER BY 
    customer_count DESC,
    a.category ASC,
    b.category ASC