# Write your MySQL query statement below
WITH cost AS (
    SELECT
        stock_name, 
        SUM(CASE WHEN operation='Sell' THEN price ELSE 0 END) AS selling_price,
        SUM(CASE WHEN operation='Buy' THEN price ELSE 0 END) AS buying_price
    FROM
        Stocks
    GROUP BY 
        stock_name
) 
SELECT 
    stock_name,
    selling_price - buying_price AS capital_gain_loss
FROM 
    cost;