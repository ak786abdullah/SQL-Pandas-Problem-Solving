-- Write a solution to find all customers who never order anything.

-- Return the result table in any order.
Select
    c.name as customers
from
    customers as c 
    left join orders as o 
    on c.id=o.customerId 
where 
    o.customerId is null ;