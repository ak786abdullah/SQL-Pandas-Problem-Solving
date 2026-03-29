WITH daily_amounts AS (
    SELECT 
        visited_on,
        SUM(amount) AS daily_amount
    FROM 
        Customer 
    GROUP BY 
        visited_on
),RollingCalculations AS (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(daily_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
    FROM 
        daily_amounts
)
SELECT 
    visited_on,
    amount,
    average_amount 
FROM 
    RollingCalculations
WHERE 
    visited_on >= (SELECT DATE_ADD(MIN(visited_on),INTERVAL 6 DAY) FROM Customer)
ORDER BY 
    visited_on ;