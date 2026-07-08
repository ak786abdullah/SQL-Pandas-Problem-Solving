# Write your MySQL query statement below
-- requirements :
-- users should be unbanned
-- we have to find number of canceled request 
-- and number of total requests 
-- to find cancellation rate
-- date should be between "2013-10-01" and "2013-10-03" 
SELECT 
    t.request_at as Day,
    ROUND(SUM(status != 'completed') / COUNT(*),2) AS 'Cancellation Rate'
FROM 
    Trips t join Users c ON c.users_id=t.client_id AND c.banned ='No'
    join Users d ON d.users_id=t.driver_id AND d.banned ='No'
WHERE 
    t.request_at between '2013-10-01' and '2013-10-03'
GROUP BY 
    t.request_at
ORDER BY 
    Day


-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna