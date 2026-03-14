-- Write a solution to find employees who have the highest salary in each of the departments.

-- Return the result table in any order.
with ranksalaries as (
SELECT 
    d.name as Department,
    e.name as Employee,
    e.salary as Salary,
    dense_rank() over (partition by d.name order by e.salary desc ) as salary_rank
from
    Department as d 
    join Employee as e 
    on d.id = e.departmentId 
    ) 

select
    Department,
    Employee,
    salary 
from 
    ranksalaries 
where 
    salary_rank =1 ;

