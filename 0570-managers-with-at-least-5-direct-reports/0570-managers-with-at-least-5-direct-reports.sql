-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.
SELECT
    e.name
FROM
    Employee as e
    join Employee as m
    on e.id =m.managerId
group by 
    m.managerId
Having 
    count(m.managerId)>= 5 ;

