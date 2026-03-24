-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.
SELECT 
    m.name
FROM 
    Employee m 
    join 
    Employee e
    on m.id=e.managerId 
GROUP BY 
    m.id,m.name 
HAVING 
    COUNT(m.id)>=5;