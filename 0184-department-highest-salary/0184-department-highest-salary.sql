-- Write a solution to find employees who have the highest salary in each of the departments.

-- Return the result table in any order.
WITH SalaryRank AS (
    SELECT 
        e.name as Employee,
        e.salary as Salary,
        d.name as Department,
        dense_rank() OVER (PARTITION BY d.name ORDER BY e.salary desc) as salary_rank
    FROM 
        Employee e 
        join Department d
        ON e.departmentId=d.id
)
SELECT 
    Department,
    Employee,
    Salary
FROM 
    SalaryRank
WHERE 
    salary_rank =1;

