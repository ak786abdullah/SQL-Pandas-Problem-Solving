-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
with salaries_rank as (
SELECT
    id,
    salary,
    dense_rank() over (order by salary desc) as ranks 
from 
    employee
) 
select 
    max(salary) as SecondHighestSalary
from 
    salaries_rank
where
    ranks=2 ;