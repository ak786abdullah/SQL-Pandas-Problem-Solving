-- Write a solution to find the employees who earn more than their managers.

-- Return the result table in any order.

select 
    e.name as Employee
from
    employee as e join employee as m on m.id=e.managerId
where
    e.salary > m.salary;
