-- Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

-- Return the result table in any order.
SELECT 
    u.user_id as buyer_id,
    u.join_date,
    IFNULL(COUNT(o.buyer_id),0) as orders_in_2019
FROM 
    Users as u 
    LEFT JOIN Orders as o 
    ON u.user_id =o.buyer_id
    AND
    YEAR(order_date)='2019'
GROUP BY 
    u.user_id
