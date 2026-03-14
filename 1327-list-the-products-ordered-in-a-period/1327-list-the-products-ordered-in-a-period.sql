-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

-- Return the result table in any order.
SELECT 
    p.product_name ,
    sum(o.unit) as unit
from
    products p
join
    orders o 
on 
    p.product_id = o.product_id 
WHERE 
    o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
group by 
    p.product_name 
having 
    unit >= 100 ;