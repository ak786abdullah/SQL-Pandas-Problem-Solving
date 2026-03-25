-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
WITH salary_ranks AS (
    SELECT 
        id,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM
        Employee 
)
SELECT
    MAX(salary) AS SecondHighestSalary 
FROM 
    salary_ranks
WHERE 
    salary_rank =2 ; 