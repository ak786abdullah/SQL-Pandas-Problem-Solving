# Write your MySQL query statement below
SELECT 
    t.request_at AS Day,
    ROUND(SUM(t.status != 'completed') / COUNT(t.status),2) AS 'Cancellation Rate'
FROM 
    Trips t
    JOIN Users A ON t.driver_id=A.users_id AND A.banned='No'
    JOIN Users B ON t.client_id=B.users_id AND B.banned='No'
WHERE 
    t.request_at BETWEEN "2013-10-01" and "2013-10-03" 
GROUP BY 
t.request_at
